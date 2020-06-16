//
//  AlbumViewModel.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation

class AlbumViewModel: ObservableObject {
     
    private let dummyPost = Album(id: 0, userId: 3, title: "Title")
    
    @Published var albums = [Album]()
    
    @Published var shouldAnimate = true
    
    private let networkManager = NetworkRequest()
     
    func fetchAllAlbumsFromAPI(userID:Int) {
        networkManager.fetchObjects(requestUrl: "\(URLConfig.userAPI)/\(userID)/albums", model: Album.self) { (albums) in
            self.albums = albums
            self.shouldAnimate.toggle()
        }
    }
}
