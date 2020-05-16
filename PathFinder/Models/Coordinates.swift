//
//  Coordinates.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 15/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

struct Coordinates {
    var lat: Double?
    var lon: Double?
    
    var isValidLocation: Bool {
        lat != nil && lon != nil
    }
}
