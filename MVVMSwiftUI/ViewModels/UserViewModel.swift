//
//  UserViewModel.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/15/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Combine
import SwiftUI
import CoreLocation
import MapKit

struct DashboardState {
    var showAlbum = false
    var showComments = false
    var showTodos = false
    var showPosts = false
}

class UserViewModel:ObservableObject {
    
    @Published var postsArray = [Post]()
    
    @Published var usersArray = [User]()
    
    @Published var selectedUser = User(id: -1, name: "Loading...", email: "name@domain.com", phone: "000-000-0000", address: Address(street: "205 N Oakhurst Dr", suite: "24", city: "Aurora", zipcode: "60504", geo: Geo(latitude: "0.4", longitude: "0.5")))
    
    @Published var dashboardState = DashboardState()
    
    @Published var selectedUserPost = Post(id: 8, title: "Loading...", body: "", userId: 10)
    
    private let dummyUser = User(id: -1, name: "Loading...", email: "name@domain.com", phone: "000-000-0000", address: Address(street: "205 N Oakhurst Dr", suite: "24", city: "Aurora", zipcode: "60504", geo: Geo(latitude: "0.4", longitude: "0.5")))
    var locationManager = LocationManager.sharedInstance
    
    private let networkManager = NetworkRequest()
    
    init() {
        fetchUsersFromAPI() 
    }
    
    func getUserAnnotation() -> CLLocationCoordinate2D {
        guard let lat = Double(selectedUser.address.geo.latitude),
            let lng = Double(selectedUser.address.geo.longitude) else { return MapView.exampleCoordinate}
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
//        let annotation = MKPointAnnotation()
//        annotation.title = "\(selectedUser.address.street),\(selectedUser.address.city)"
//        annotation.subtitle = "\(selectedUser.name),\(selectedUser.phone)"
//        annotation.coordinate = coordinate
//        return annotation
    }
    func fetchUsersFromAPI() {
        usersArray.append(dummyUser) // Added for test
        networkManager.fetchObjects(requestUrl: URLConfig.userAPI, model: User.self) { (users) in
            self.usersArray = users
        }
    }
}
