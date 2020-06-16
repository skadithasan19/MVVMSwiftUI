//
//  AlbumCell.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI

struct AlbumCell: View {
    var album:Album
    var body: some View {
        Button(action: {
            
        }, label: {
            VStack(alignment: .center) {
                Image("defaultProfilePicture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding(10)
        }).buttonStyle(PlainButtonStyle())
    }
}
