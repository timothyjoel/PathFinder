//
//  CoordinateParameter.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 16/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

enum CoordinateParameter {
    
    case longitude
    case latitude
    
    var name: String {
        switch self {
        case .latitude: return "Latitude"
        case .longitude: return "Longitude"
        }
    }
    
    var upperLimit: Double {
        switch self {
        case .latitude: return 90.0
        case .longitude: return 180.0
        }
    }
    
    var lowerLimit: Double {
        switch self {
        case .latitude: return -90.0
        case .longitude: return -180.0
        }
    }
    
}
