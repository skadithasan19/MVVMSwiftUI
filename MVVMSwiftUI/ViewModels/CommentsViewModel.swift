//
//  CommentsViewModel.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation

class CommentsViewModel: ObservableObject {
     
    @Published var comments = [Comment]()
    
    @Published var shouldAnimate = true
    
    private let networkManager = NetworkRequest()
     
    func fetchAllCommentsFromAPI(postID:Int) {
        networkManager.fetchObjects(requestUrl: "\(URLConfig.postAPI)/\(postID)/comments", model: Comment.self) { (comments) in
            self.comments = comments
            self.shouldAnimate.toggle()
        }
    }
}
