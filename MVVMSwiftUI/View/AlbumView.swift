//
//  AlbumView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import QGrid
import Utilities
struct AlbumView: View {
    @EnvironmentObject var viewModel:UserViewModel
    @ObservedObject var albumViewModel = AlbumViewModel()
    var body: some View {
        VStack {
            if albumViewModel.shouldAnimate {
                ActivityIndicatorSmall(animate: $albumViewModel.shouldAnimate)
                    .frame(height:400)
            } else {
                List(albumViewModel.albums, id: \.id) { item in
                    NavigationLink(destination: GalleryView(album: item)) {
                        Text(item.title)
                        .font(.system(size: 14, weight: .bold, design: .default))
                    }
                }
            }
        }.navigationBarTitle("Albums")
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
