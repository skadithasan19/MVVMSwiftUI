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
     
    func fetchAllAlbumsFromAPI(userID:Int) { /// Using ID 1 for now. since other ID's does not work some times
        networkManager.fetchObjects(requestUrl: "\(URLConfig.userAPI)/1/albums", model: Album.self) { (albums) in
            self.albums = albums
            self.shouldAnimate.toggle()
        }
    }
}
