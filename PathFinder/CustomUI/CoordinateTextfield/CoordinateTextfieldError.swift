//
//  CoordinateTextfieldError.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 16/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

enum CoordinateTextfieldError {
    
    case valueIsTooHigh
    case valueIsTooLow
    case valueIsInvalid
    
    var message: String? {
        switch self {
        case .valueIsTooHigh: return "Value is too high"
        case .valueIsTooLow: return "Value is too low"
        case .valueIsInvalid: return "Invalid value"
        }
    }
    
}
