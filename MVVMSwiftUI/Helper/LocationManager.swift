//
//  LocationManager.swift
//  iPandemic
//
//  Created by Hasan, MdAdit on 3/27/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import Foundation
import CoreLocation
import Combine
import Contacts
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    static let sharedInstance = LocationManager()
    
    private let geocoder = CLGeocoder()
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    private let locationManager = CLLocationManager()
    
    var updateOnce = false
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    @Published var locationStatus: CLAuthorizationStatus? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var lastLocation: CLLocation? {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var firstPlaceMark: CLPlacemark? {
        willSet {
            objectWillChange.send()
        }
    }
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
        
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if updateOnce { return }
        
        guard let location = locations.last else { return }
        self.lastLocation = location
        geocoder.reverseGeocodeLocation(location) { (marks, error) in
            guard let placemarks = marks,
                let placemark = placemarks.first else {
                    return
            }

            let postalAddressFormatter = CNPostalAddressFormatter()
            postalAddressFormatter.style = .mailingAddress
            if let postalAddress = placemark.postalAddress {
                let addressString = postalAddressFormatter.string(from: postalAddress)
                print(addressString)
                DispatchQueue.main.async {
                    self.firstPlaceMark = placemark
                }
            }
        }
         updateOnce = true
        print(#function, location)
    }
    
    var LocationPin: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationManager.location?.coordinate ?? MapView.exampleCoordinate
        return annotation
    }
    
}
