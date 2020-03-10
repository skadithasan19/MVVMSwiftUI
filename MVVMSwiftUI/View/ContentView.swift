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
    
    var body: some View {
        
        NavigationView {
            VStack {
                UserHorizontalSectionView()
                UserPostSectionViewModel()
            }
            .navigationBarTitle("User Post's")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
 
