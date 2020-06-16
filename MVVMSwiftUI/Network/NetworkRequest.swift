//
//  NetworkRequest.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/15/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Combine
import SwiftUI

class NetworkRequest {
    var subscribers = Set<AnyCancellable>()
    func fetchObjects<T:Decodable>(requestUrl:String, model: T.Type, completion:@escaping((_ objects: [T]) -> Void))  {
        guard let url = URL(string: requestUrl) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw HTTPError.statusCode
                }
                return output.data
        }
        .decode(type: [T].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .receive(on: RunLoop.main)
        .sink(receiveValue: { objects in
            completion(objects)
        }).store(in: &subscribers)
    }
}
