//
//  UserHorizontalSectionView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Combine
import QGrid
struct UserHorizontalSectionView: View {
    
    @EnvironmentObject var viewModel:UserViewModel
    
    @State var showPosts = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: DashBoardView(), isActive: $showPosts) { EmptyView() }
            QGrid(viewModel.usersArray, columns: 3) {
                UserView(user: $0) { (user) in
                    self.viewModel.selectedUser = user
                    self.showPosts.toggle()
                }
            }
        }
    }
}

struct UserHorizontalSectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserHorizontalSectionView()
    }
}

