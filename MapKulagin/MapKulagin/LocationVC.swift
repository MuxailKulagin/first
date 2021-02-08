//
//  ViewController.swift
//  MapKulagin
//
//  Created by competitor on 01.02.2021.
//


import UIKit
import CoreLocation
class LocationVC: UITableViewController, CLLocationManagerDelegate {
    let LocationManager = CLLocationManager()
    @IBOutlet weak var dataLat:UILabel!
    @IBOutlet weak var dataLon:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthorization()

    }
    


    
    func checkAuthorization() {
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            LocationManager.delegate = self
            LocationManager.desiredAccuracy = kCLLocationAccuracyBest
            LocationManager.startUpdatingLocation()
            print("Error")
        case .notDetermined:
            LocationManager.requestWhenInUseAuthorization()
        default:
            break
        
        }
        
    }
    
    
    func LocationManager (_ mamager: CLLocationManager, didUpdateLocations locations: [ CLLocation]){
        if let location = locations.last?.coordinate {
            dataLat.text = String(location.latitude)
            dataLat.text = String(location.longitude)
            LocationManager.stopUpdatingLocation()
        }
        
    }
}

