//
//  DataDecoder.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class DataDecoder {
    
    func decode<T: Decodable>(_ data: Data, completion: (T) -> Void) {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(decodedData)
        } catch {
            debugPrint(error)
        }
    }
    
}
