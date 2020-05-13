//
//  LocationSearchEngine.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class LocationSearchEngine {
    
    var urlCreator = NominatimURLCreator()
    var fetcher = DataFetcher()
    var decoder = DataDecoder()
    
    func search(_ coordinates: Coordinates, completion: @escaping (FetchedLocation) -> Void) {
        guard let url = urlCreator.createURL(coordinates) else {
            return
        }
        fetcher.fetchData(from: url) { (data) in
            self.decoder.decode(data) { (decodedData) in
                completion(decodedData)
            }
        }
    }
    
}
