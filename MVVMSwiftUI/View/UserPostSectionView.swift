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
    
    @ObservedObject var viewModel = PostViewModel()

    var body: some View { 
        VStack {
            List(viewModel.postsArray, id: \.id) { item in
                NavigationLink(destination: CommentsView(post: item)) {
                     PostView(post: item)
                } 
            }
        }.navigationBarTitle("Posts")
    }
}

struct UserPostSectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostSectionView()
    }
}
