//
//  Todo.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation


struct Todo: Codable {

    let id: Int
    let title: String
    let completed: Bool
    let userId: Int
}
