//
//  UserHorizontalSectionView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Combine

struct UserHorizontalSectionView: View {
    
    @ObservedObject var networkLayer = NetworkLayer()
     
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(networkLayer.usersArray, id: \.name) { userObj in
                    UserView(user: userObj)
                }
            }
            .padding(.leading, 10)
        }
    }
    
}

struct UserHorizontalSectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserHorizontalSectionView()
    }
}



struct UserView: View {
    
    var user:User
    
    var body: some View {
        VStack(alignment: .center) {
            Image("familyRoomCoupleDog2572")
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
