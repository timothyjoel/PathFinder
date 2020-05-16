//
//  LocationURLCreator.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

class LocationURLCreator {
    
    func createURL(for coordinates: Coordinates) -> URL {
        var components      = URLComponents()
        components.scheme   = "https"
        components.host     = "nominatim.openstreetmap.org"
        components.path     = "/reverse"
        components.queryItems = [
            URLQueryItem(name: "format", value: "jsonv2"),
            URLQueryItem(name: "lat", value: String(coordinates.lat ?? 0.0)),
            URLQueryItem(name: "lon", value: String(coordinates.lon ?? 0.0))]
        return components.url!
    }
    
}
