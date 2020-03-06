//
//  User.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation
 
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phone: String
}

