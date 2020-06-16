//
//  CustomButton.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    var title:String
    var bgColor:Color
    var action:()->Void
    var body: some View {
        Button(action: action, label: {
            VStack(alignment: .center) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }.background(bgColor).cornerRadius(10)
        })
    }
}

