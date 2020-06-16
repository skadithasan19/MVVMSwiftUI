//
//  Comment.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: Int
    let postId : Int
    let name: String
    let email: String
    let body: String
}
