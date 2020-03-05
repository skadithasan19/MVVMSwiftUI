//
//  UserHorizontalSectionView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI

struct UserHorizontalSectionView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                UserView()
                UserView()
                UserView()
                UserView()
                UserView()
                UserView()
                UserView()
                UserView()
                UserView()
            }
        }
    }
}

struct UserHorizontalSectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserHorizontalSectionView()
    }
}



struct UserView: View {
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
            
            Text("Adit")
        }.padding(10)
    }
}
