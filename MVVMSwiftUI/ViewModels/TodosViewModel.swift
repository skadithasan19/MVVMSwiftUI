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
     
    func fetchAllTodosFromAPI(userID:Int) { /// Using ID 1 for now. since other ID's does not work some times
        networkManager.fetchObjects(requestUrl: "\(URLConfig.userAPI)/1/todos", model: Todo.self) { (todos) in
            self.todos = todos
            self.shouldAnimate.toggle()
        }
    }
}
