//
//  ContentView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITableView.appearance().separatorColor = .clear // cell separator
    }
    @State var navigationLinkActive = false
    var body: some View {
        
        NavigationView {
            List {
                UserHorizontalSectionView()
                NavigationLink(destination: UserHorizontalSectionView(), isActive: $navigationLinkActive) {
                    PostView()
                }
                PostView()
                PostView()
                PostView()
                PostView()
                PostView()
            }
                
            .navigationBarTitle("News Title")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
