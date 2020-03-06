//
//  NetworkLayer.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import UIKit
import Combine


class NetworkLayer:ObservableObject {
    
    private var subscribers = Set<AnyCancellable>()
    
    @Published var postsArray = [Post]()
    
    @Published var usersArray = [User]()
    
    
    init() {
        fetchUsersFromAPI()
        fetchPostFromAPI()
    }
    
    func fetchUsersFromAPI() {
        usersArray.append(User(id: -1, name: "Loading...", email: "name@domain.com", phone: "000-000-0000"))
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw HTTPError.statusCode
                }
                return output.data
        }
        .decode(type: [User].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .receive(on: RunLoop.main)
        .sink(receiveValue: { users in
            self.usersArray = users
        }).store(in: &subscribers)
    }
    
    func fetchPostFromAPI() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw HTTPError.statusCode
                }
                return output.data
        }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .receive(on: RunLoop.main)
        .sink(receiveValue: { posts in
            self.postsArray = posts
        }).store(in: &subscribers)
    }
    
}
