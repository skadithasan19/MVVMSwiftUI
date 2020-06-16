//
//  GallaryViewModel.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation

class GalleryViewModel: ObservableObject {
      
    @Published var photos = [Photo]()
    
    @Published var shouldAnimate = true
    
    private let networkManager = NetworkRequest()
     
    func fetchAllPhotosFromAPI(albumID:Int) {
        networkManager.fetchObjects(requestUrl: "\(URLConfig.albumAPI)/1/photos", model: Photo.self) { (photos) in
            print(photos.compactMap({ $0.thumbnailUrl }))
            self.photos = photos
            self.shouldAnimate.toggle()
        }
    }
}
