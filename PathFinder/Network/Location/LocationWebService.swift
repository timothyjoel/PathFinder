//
//  LocationWebService.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class LocationWebService {
    
    var urlCreator = LocationURLCreator()
    var dataFetcher = DataFetcher()
    var dataDecoder = DataDecoder()
    
    func search(_ coordinates: Coordinates, completion: @escaping (FetchedLocation) -> Void) {
        let url = urlCreator.createURL(for: coordinates)
        dataFetcher.fetch(from: url) { (data) in
            self.dataDecoder.decode(data) { (decodedData) in
                completion(decodedData)
            }
        }
    }
    
}
