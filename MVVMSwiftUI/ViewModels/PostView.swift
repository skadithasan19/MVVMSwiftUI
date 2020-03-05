//
//  PostView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI

struct PostView:View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Text("Jump to Presidential campaigns - A political campaign is an organized effort which seeks to influence the decision making progress within a specific group. In democracies, political campaigns often refer to electoral campaigns, by which representatives are chosen or referendums are decided.")
                .font(.subheadline)
                .foregroundColor(Color.gray)
                .lineLimit(nil)
            
            Text("@2020 World Election")
                .font(.title).foregroundColor(.black)
            
        }
    }
}
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
