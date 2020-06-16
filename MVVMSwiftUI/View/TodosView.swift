//
//  TodosView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Utilities

struct TodosView: View {
    
    @EnvironmentObject var viewModel:UserViewModel
    
    @ObservedObject var todoViewModel = TodosViewModel()
    
    var body: some View {
        
        VStack {
            if todoViewModel.shouldAnimate {
                ActivityIndicatorSmall(animate: $todoViewModel.shouldAnimate)
                    .frame(height:400)
            } else {
                List(todoViewModel.todos, id: \.id) { item in
                    HStack {
                        Text(item.title)
                            .font(.subheadline)
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(item.completed == false ? "unchecked" : "checked")
                                .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .frame(width:30, height: 30)
                                .aspectRatio(contentMode: .fit)
                        })
                    }
                }
            }
        }.navigationBarTitle("Todos").onAppear {
            self.todoViewModel.fetchAllTodosFromAPI(userID: self.viewModel.selectedUser.id)
        }
    }
}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView()
    }
}
