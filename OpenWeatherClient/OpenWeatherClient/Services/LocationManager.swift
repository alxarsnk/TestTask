//
//  LocationManager.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerProtocol {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    
    func intialSetup ()
    
    func getMyPosition(complition: @escaping (String, String)->())
}

class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerProtocol {
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    var longitude: String!
    var latitude: String!
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let currentLocation = location.coordinate
        latitude = String(currentLocation.latitude)
        longitude = String(currentLocation.longitude)
    }
    
    func intialSetup () {
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
    func getMyPosition(complition: @escaping (String, String)->()) {
          DispatchQueue.main.asyncAfter(deadline: .now()) {
            complition(self.latitude, self.longitude)
        }
    }
}
