//
//  MapVC.swift
//  MapKulagin
//
//  Created by competitor on 01.02.2021.
//

import UIKit
import CoreLocation
import MapKit
    class mapVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
        @IBOutlet weak var mapView: MKMapView!
        let location = CLLocationManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
        mapView.delegate = self
         
        location.startUpdatingLocation()
    
        mapView.userLocation.title = "Im here"
        mapView.userLocation.subtitle = "You fond me"
    
    }
        func mapView (_ mapView: MKMapView, viewForannotation: MKAnnotation) -> MKAnnotationView {
            if annotation.coordinate.latitude != mapView.userLocation.coordinate.latitude && annotation.coordinate.longitude != mapView.userLocation.coordinate.longitude {
                let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "marker" )
                marker.canShowCallout = true
                let infoButton = UIButton(Type: .detailDisclosure)
                infoButton.addTarget(self, action: #selector(InfoAction),for: .touchUpInside  )
                marker.rightCalloutAccessoryView = infoButton
                marker.calloutOffset = CGPoint (x:-5 y: 5 )
                return marker
            }
            return nil
            
            
        }
    

}
