//
//  DataFetcher.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class DataFetcher {
    
    func fetch(from: URL, completion: @escaping (Data) -> Void) {
        URLSession.shared.dataTask(with: from) { (data, response, error) in
            guard error == nil else {
                return
            }
            guard let response = response as? HTTPURLResponse, response.isResponseOK else {
                return
            }
            guard let data = data else {
                return
            }
            completion(data)
        }
        .resume()
    }
    
}
