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
    
    var resultStatus: String {
        isSearchValid ? SearchLocationStatus.correct.message : SearchLocationStatus.incorrect.message
    }
    
    var statusColor: UIColor {
       isSearchValid ? SearchLocationStatusColor.correct.color : SearchLocationStatusColor.incorrect.color
    }
    
    var distanceInKm: String {
        getDistanceBetweenLocations(in: .kilometers)
    }
    
    var distanceInM: String {
        getDistanceBetweenLocations(in: .meters)
    }
    
}

extension HomeViewModel {
    
    private var isSearchValid: Bool {
        coordinates1.isValidLocation && coordinates2.isValidLocation
    }
    
    private func getDistanceBetweenLocations(in unit: DistanceUnit) -> String  {
        guard isSearchValid else { return "-" }
        
        let location1 = CLLocation(latitude: coordinates1.lat!, longitude: coordinates1.lon!)
        let location2 = CLLocation(latitude: coordinates2.lat!, longitude: coordinates2.lon!)
        let distance = location1.distance(from: location2)
        
        switch unit {
            case .kilometers:
                return String(Double(distance/1000).rounded(toPlaces: 1))
            case .meters:
                return String(Double(distance).rounded(toPlaces: 1))
        }
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

enum SearchLocationStatus {
    
    case incorrect
    case correct
    
    var message: String {
        switch self {
        case .incorrect: return "Fill in all coordinates"
        case .correct: return "Coordinates filled correctly"
        }
    }
    
}

enum SearchLocationStatusColor {
    
    case correct
    case incorrect
    
    var color: UIColor {
        switch self {
        case .incorrect: return UIColor.systemRed
        case .correct: return UIColor.systemGreen
        }
    }
    
}

enum DistanceUnit {
    case kilometers
    case meters
}

