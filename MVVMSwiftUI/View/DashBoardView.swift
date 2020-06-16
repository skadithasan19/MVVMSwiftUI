//
//  DashBoardView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Utilities
import CoreLocation
struct DashBoardView: View {
    
    @EnvironmentObject var viewModel:UserViewModel
   
    var body: some View {
        VStack(alignment: .center) {
            PersonalInfoView(selectedUser: viewModel.selectedUser)
            
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
            MapView(centerCoordinate: viewModel.getUserAnnotation(), annotations: [viewModel.locationManager.LocationPin]) 
        }
    }
}

struct PersonalInfoView: View {
    
    var selectedUser:User
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center, spacing: 10) {
                Text("User Profile")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                Rectangle().frame(height: 1.0)
                    .padding(.horizontal, 1.0)
                    .foregroundColor(Color(ColorUtilities.hexStringToUIColor(hex: "D9D9D9")))
                Text("\(selectedUser.name)")
                    .font(.title)
                    .foregroundColor(.white)
                Text("\(selectedUser.email)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("\(selectedUser.phone)")
                    .font(.subheadline)
                    .foregroundColor(.white).padding(.bottom, 10)
            }.background(Color.blue).cornerRadius(10)
        }.padding()
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
