//
//  MapView.swift
//  MVVMSwiftUI
//
//  Created by Hasan, MdAdit on 6/16/20.
//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var centerCoordinate: CLLocationCoordinate2D
    
    var annotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.addAnnotations(annotations)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
            annotationView.canShowCallout = true
            annotationView.image = UIImage(systemName: "mappin")
            return annotationView
        }
    }
    
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
    
    static var exampleCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
    }
}


//struct CKMapView: UIViewRepresentable {
//    
//    var centerCoordinate:CLLocationCoordinate2D
//    
//    var annotations:[MKAnnotation]
//    
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.showsUserLocation = true
//        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: span)
//        mapView.setRegion(region, animated: true)
//        mapView.delegate = context.coordinator
//        return mapView
//    }
//    
//    func updateUIView(_ view: MKMapView, context: Context) {
//        view.removeAnnotations(view.annotations)
//        if annotations.count > 0 {
//            view.addAnnotations(annotations)
//            let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//            let region = MKCoordinateRegion(center: centerCoordinate, span: span)
//            view.setRegion(region, animated: true)
//            /// drow ploygon
//            var locations = annotations.map { $0.coordinate }
//            let polyline = MKPolyline(coordinates: &locations, count: locations.count)
//            view.addOverlay(polyline)
//            
//            let overlays = annotations.map { MKCircle(center: $0.coordinate, radius: 100) }
//            view.addOverlays(overlays)
//            
//            let polygon = MKPolygon(coordinates: &locations, count: locations.count)
//            view.addOverlay(polygon)
//        }
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MapView
//        
//        init(_ parent: MapView) {
//            self.parent = parent
//        }
//        
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
//            annotationView.canShowCallout = true
//            //annotationView.image = UIImage(named: "covid")
//            return annotationView
//        }
//        
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            
//            if overlay is MKCircle {
//                let renderer = MKCircleRenderer(overlay: overlay)
//                renderer.fillColor = UIColor.orange.withAlphaComponent(0.5)
//                renderer.strokeColor = .orange
//                renderer.lineWidth = 1
//                return renderer
//            } else if overlay is MKPolyline {
//                let renderer = MKPolylineRenderer(overlay: overlay)
//                renderer.fillColor = UIColor.red.withAlphaComponent(0.5)
//                renderer.strokeColor = .red
//                renderer.lineWidth = 3
//                return renderer
//            } else if overlay is MKPolygon {
//                let renderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
//                renderer.fillColor = UIColor.red.withAlphaComponent(0.5)
//                renderer.strokeColor = .red
//                renderer.lineWidth = 2
//                return renderer
//            }
//            
//            return MKOverlayRenderer()
//        }
//        
//        func mapView(_ mapView: MKMapView, didAdd renderers: [MKOverlayRenderer]) {
//            
//        }
//        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//            // parent.centerCoordinate = mapView.centerCoordinate
//        }
//    }
//    
//    
//    static var example: CLLocationCoordinate2D {
//        return CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
//    }
//    
//    static var exampleAnnotation: MKPointAnnotation {
//        let annotation = MKPointAnnotation()
//        annotation.title = "London"
//        annotation.subtitle = "Home to the 2012 Summer Olympics."
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
//        return annotation
//    }
//}
