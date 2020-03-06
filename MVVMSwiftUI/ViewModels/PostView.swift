//
//  PostView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI

struct PostView:View {
    
    var post:Post
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Text(post.title)
                .font(.title)
                .foregroundColor(.black)
                .lineLimit(nil)
            Text(post.body)
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
}
 
