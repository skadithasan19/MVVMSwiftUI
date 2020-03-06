//
//  UserPostSectionView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Combine

struct UserPostSectionView: View {
    
    @ObservedObject var networkLayer = NetworkLayer()
    
    var body: some View { 
        List(networkLayer.postsArray, id: \.id) { item in
            PostView(post: item)
        }
    }
}

struct UserPostSectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostSectionView()
    }
}
