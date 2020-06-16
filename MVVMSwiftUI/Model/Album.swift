//
//  Album.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation

struct Album: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String 
}
