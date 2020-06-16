//
//  GallaryView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Utilities
import QGrid
struct GalleryView: View {
    
    var album:Album
    
    @ObservedObject var galleryViewModel = GalleryViewModel()
    
    var body: some View {
        VStack {
            if galleryViewModel.shouldAnimate {
                ActivityIndicatorSmall(animate: $galleryViewModel.shouldAnimate)
                    .frame(height:400)
            } else {
                QGrid(galleryViewModel.photos, columns: 3) {
                    RemoteImage(url: URL(string: $0.thumbnailUrl)!)
                }
            }
        }.navigationBarTitle("Gallary").onAppear {
            self.galleryViewModel.fetchAllPhotosFromAPI(albumID: self.album.id)
        }
    }
}
