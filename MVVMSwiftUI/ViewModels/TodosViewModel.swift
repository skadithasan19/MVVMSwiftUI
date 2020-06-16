//
//  TodosViewModel.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation

class TodosViewModel: ObservableObject {
     
    @Published var todos = [Todo]()
    
    @Published var shouldAnimate = true
    
    private let networkManager = NetworkRequest()
     
    func fetchAllTodosFromAPI(userID:Int) {
        networkManager.fetchObjects(requestUrl: "\(URLConfig.userAPI)/\(userID)/todos", model: Todo.self) { (todos) in
            self.todos = todos
            self.shouldAnimate.toggle()
        }
    }
}
