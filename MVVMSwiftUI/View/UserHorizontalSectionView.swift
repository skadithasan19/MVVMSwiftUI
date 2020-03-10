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
    
    @EnvironmentObject var networkLayer:NetworkLayer
     
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(networkLayer.usersArray, id: \.name) { userObj in
                    UserView(user: userObj).onTapGesture {
                        self.networkLayer.fetchUserPostFromAPI(userId: "\(userObj.id)")
                        self.networkLayer.objectWillChange.send()
                    }
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
 
