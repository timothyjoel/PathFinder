//
//  HomeViewModel.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 12/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit
import CoreLocation

struct Location {
   let lat: Double
   let lon: Double
}

class HomeViewModel {
    
    var location1 = Location(lat: 0, lon: 0)
    var location2 = Location(lat: 0, lon: 0)
    
    func getDistanceBetweenLocations() {
        let coordinate1 = CLLocation(latitude: location1.lat, longitude: location1.lon)
        let coordinate2 = CLLocation(latitude: location2.lat, longitude: location2.lon)
        let distance = coordinate1.distance(from: coordinate2)
        print(distance)
    }
    
    func validateInputs(_ location: Location) {
        
    }
    
}
