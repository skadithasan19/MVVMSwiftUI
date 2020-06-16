//
//  CommentsView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Utilities
struct CommentsView: View {
    
    var post:Post
    
    @ObservedObject var commentsViewModel = CommentsViewModel()
    
    var body: some View {
        VStack {
            if commentsViewModel.shouldAnimate {
                ActivityIndicatorSmall(animate: $commentsViewModel.shouldAnimate)
                    .frame(height:400)
            } else {
                List(commentsViewModel.comments, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                        Text(item.body)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Spacer()
                            Text(item.email)
                                .font(.footnote)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
            }
            }.navigationBarTitle("Comments").onAppear {
                self.commentsViewModel.fetchAllCommentsFromAPI(postID: self.post.id)
        }
    }
}
 
