//
//  UserView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/6/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI

struct UserView: View {
    
    var user:User 
    var body: some View {
        VStack(alignment: .center) {
            Image("defaultProfilePicture")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height: 100)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 3)
            Text(user.name)
        }.padding(10)
    }
}
 
