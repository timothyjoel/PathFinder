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
    var lat: Double?
    var lon: Double?
    
    var isValidLocation: Bool {
        lat != nil && lon != nil
    }
}

class HomeViewModel {
    
    var location1 = Location(lat: nil, lon: nil)
    var location2 = Location(lat: nil, lon: nil)
    
    func getDistanceBetweenLocations() -> String  {
        guard didProvideValidLocations() else {
            return "Please fill all the fields"
        }
        let coordinate1 = CLLocation(latitude: location1.lat!, longitude: location1.lon!)
        let coordinate2 = CLLocation(latitude: location2.lat!, longitude: location2.lon!)
        let distance = coordinate1.distance(from: coordinate2)
        return String(distance)
    }
    
    private func didProvideValidLocations() -> Bool {
        return location1.isValidLocation && location2.isValidLocation
    }
    
}
