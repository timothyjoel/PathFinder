//
//  SearchResultStatus.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 15/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

enum SearchLocationStatus {

    case failed
    case success
    
    var message: String {
        switch self {
        case .failed: return "Fill in all the fields"
        case .success: return "Successfully found locations"
        }
    }
    
}
