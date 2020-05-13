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

enum DistanceUnit {
    case kilometers, meters
}

class HomeViewModel {
    
    var location1 = Location(lat: nil, lon: nil)
    var location2 = Location(lat: nil, lon: nil)
    
    func getDistanceBetweenLocations(in unit: DistanceUnit) -> String  {
        guard checkForDataCorrectness() else {
            return "-"
        }
        
        let coordinate1 = CLLocation(latitude: location1.lat!, longitude: location1.lon!)
        let coordinate2 = CLLocation(latitude: location2.lat!, longitude: location2.lon!)
        let distance = coordinate1.distance(from: coordinate2)
        
        switch unit {
            case .kilometers: return String(Double(distance/1000).rounded(toPlaces: 1))
            case .meters: return String(Double(distance).rounded(toPlaces: 1))
        }
    }
    
    func getResultInfoMessage() -> String {
       return checkForDataCorrectness() ? "Successfully found the distance" : "Fill in all the fields"
    }
    
    func getResultInfoMessageColor() -> UIColor {
        return checkForDataCorrectness() ? .systemGreen : .systemRed
    }
    
    private func checkForDataCorrectness() -> Bool {
        return location1.isValidLocation && location2.isValidLocation
    }
    
}
