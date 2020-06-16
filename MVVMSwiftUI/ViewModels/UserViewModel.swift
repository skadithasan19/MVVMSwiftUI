//
//  UserViewModel.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/15/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Combine
import SwiftUI

struct DashboardState {
    var showAlbum = false
    var showComments = false
    var showTodos = false
    var showPosts = false
}

class UserViewModel:ObservableObject {
    
    @Published var postsArray = [Post]()
    
    @Published var usersArray = [User]()
    
    @Published var selectedUser = User(id: -1, name: "Loading...", email: "name@domain.com", phone: "000-000-0000")
    
    @Published var dashboardState = DashboardState()
    
    @Published var selectedUserPost = Post(id: 8, title: "Loading...", body: "", userId: 10)
    
    private let dummyUser = User(id: -1, name: "Loading...", email: "name@domain.com", phone: "000-000-0000")
    
    private let networkManager = NetworkRequest()
    
    init() {
        fetchUsersFromAPI() 
    }
    
    func fetchUsersFromAPI() {
        usersArray.append(dummyUser) // Added for test
        networkManager.fetchObjects(requestUrl: URLConfig.userAPI, model: User.self) { (users) in
            self.usersArray = users
        }
    }
}
