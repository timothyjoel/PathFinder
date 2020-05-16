//
//  SearchResultStatus.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 15/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

enum SearchLocationStatus {

    case incorrect
    case correct
    
    var message: String {
        switch self {
        case .incorrect: return "Fill in all correct coordinates"
        case .correct: return "Coordinates filled correctly"
        }
    }
    
}

enum SearchLocationStatusColor {
    
    case correct
    case incorrect
    
    var color: UIColor {
        switch self {
        case .incorrect: return UIColor.red
        case .correct: return UIColor.green
        }
    }
    
}
