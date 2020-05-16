//
//  HomeViewModel.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 12/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewModel {
    
    private var locationSearchEngine = LocationWebService()
    var coordinates1 = Coordinates(lat: nil, lon: nil)
    var coordinates2 = Coordinates(lat: nil, lon: nil)
    
}
    
extension HomeViewModel {
    
    func getDistanceBetweenLocations(in unit: DistanceUnit) -> String  {
        guard isSearchValid() else {
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
    
    func getSearchLocationStatus() -> String {
        return isSearchValid() ? SearchLocationStatus.correct.message : SearchLocationStatus.incorrect.message
    }
    
    func getSearchLocationStatusColor() -> UIColor {
        return isSearchValid() ? SearchLocationStatusColor.correct.color : SearchLocationStatusColor.incorrect.color
    }
    
    func isSearchValid() -> Bool {
        return coordinates1.isValidLocation && coordinates2.isValidLocation
    }
    
    func getLocationFor(_ coordinates: Coordinates, completion: @escaping (String) -> Void) {
        guard coordinates.isValidLocation else {
            return completion("-")
        }
        self.locationSearchEngine.search(coordinates) { (fetchedLocation) in
            return completion(fetchedLocation.display_name ?? "Unknown location")
        }
    }
    
}