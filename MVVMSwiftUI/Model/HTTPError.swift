//
//  HTTPError.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 3/5/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation

enum HTTPError: LocalizedError {
    case statusCode
    case post
}


enum Error: Swift.Error {
    case invalidResponse
    case invalidJSON
}
