//
//  PostViewModel.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation

class PostViewModel: ObservableObject {
    
    private let dummyPost = Post(id: 8, title: "Loading...", body: "", userId: 10)
    
    @Published var postsArray = [Post]()
    
    private let networkManager = NetworkRequest()
    
    init() {
        fetchAllPostFromAPI()
    }
    
    func fetchAllPostFromAPI() {
        networkManager.fetchObjects(requestUrl: URLConfig.postAPI, model: Post.self) { (posts) in
            self.postsArray = posts
        }
    }
    
    func fetchUserPostFromAPI(userId:Int) {
        let tempArray = self.postsArray.filter({ $0.id == userId })
        self.postsArray = tempArray
    }
}
