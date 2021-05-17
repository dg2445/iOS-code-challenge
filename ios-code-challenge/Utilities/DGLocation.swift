//
//  DGLocation.swift
//  ios-code-challenge
//
//  Created by Dave Grzeskowiak on 5/16/21.
//  Copyright © 2021 Dustin Lange. All rights reserved.
//

import Foundation
import CoreLocation

@objc class DGLocation: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    
    @objc func latitude() -> String
    {
    
        return self.getLatitude()
    }
    
    @objc func longitude() -> String
    {

        return self.getLongitude()
    }
    
    private func getLatitude() -> String
    {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
                    locationManager.delegate = self
                    locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
                    locationManager.startUpdatingLocation()
           var foo =  locationManager.location
            print(foo?.coordinate.latitude)
                    }
        return "41.619549"
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                print(location.coordinate)
            }
        }
    
    private func getLongitude() -> String
    {
        return "-93.598022"
    }
}
