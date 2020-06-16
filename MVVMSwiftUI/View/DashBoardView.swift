//
//  DashBoardView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Utilities
struct DashBoardView: View {
    
    @EnvironmentObject var viewModel:UserViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    VStack(alignment: .center, spacing: 10) {
                        Text("User Profile")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 10) 
                        Rectangle().frame(height: 1.0)
                            .padding(.horizontal, 1.0)
                            .foregroundColor(Color(ColorUtilities.hexStringToUIColor(hex: "D9D9D9")))
                        Text("\(viewModel.selectedUser.name)")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("\(viewModel.selectedUser.email)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("\(viewModel.selectedUser.phone)")
                            .font(.subheadline)
                            .foregroundColor(.white).padding(.bottom, 10)
                    }.background(Color.blue).cornerRadius(10)
                }.padding()
                
                HStack {
                    NavigationLink(destination: UserPostSectionView(),
                                   isActive: self.$viewModel.dashboardState.showPosts) {
                                    EmptyView()
                    }
                    NavigationLink(destination: AlbumView(),
                                   isActive: self.$viewModel.dashboardState.showAlbum) {
                                    EmptyView()
                    }
                    NavigationLink(destination: TodosView(),
                                   isActive: self.$viewModel.dashboardState.showTodos) {
                                    EmptyView()
                    }
                    CustomButton(title: "Album", bgColor: .pink) {
                        self.viewModel.dashboardState.showAlbum.toggle()
                    }
                    CustomButton(title: "Posts", bgColor: .orange) {
                        self.viewModel.dashboardState.showPosts.toggle()
                    }
                    CustomButton(title: "Todos", bgColor: .green) {
                        self.viewModel.dashboardState.showTodos.toggle()
                    }
                }.padding()
                
                Spacer()
            }
        }
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
