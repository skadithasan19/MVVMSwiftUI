//
//  User.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation


struct Geo:Codable {
    let latitude:String
    let longitude:String
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

struct Address:Codable {
    let street:String
    let suite:String
    let city:String
    let zipcode:String
    let geo:Geo
}
 
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let address: Address
}

