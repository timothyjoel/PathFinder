//
//  HomeViewModel.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 12/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit
import CoreLocation

struct Coordinates {
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
    
    var locationSearchEngine = LocationSearchEngine()
    var coordinates1 = Coordinates(lat: nil, lon: nil)
    var coordinates2 = Coordinates(lat: nil, lon: nil)
    
    func getDistanceBetweenLocations(in unit: DistanceUnit) -> String  {
        guard checkForDataCorrectness() else {
            return "-"
        }
        
        let location1 = CLLocation(latitude: coordinates1.lat!, longitude: coordinates1.lon!)
        let location2 = CLLocation(latitude: coordinates2.lat!, longitude: coordinates2.lon!)
        let distance = location1.distance(from: location2)
        
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
    
    func checkForDataCorrectness() -> Bool {
        return coordinates1.isValidLocation && coordinates2.isValidLocation
    }
    
    func getLocationFor(_ coordinates: Coordinates, completion: @escaping (String) -> Void) {
        guard checkForDataCorrectness() else {
            return completion("-")
        }
        locationSearchEngine.search(coordinates) { (fetchedLocation) in
            return completion(fetchedLocation.display_name ?? "Unknown location")
        }
    }
    
}
