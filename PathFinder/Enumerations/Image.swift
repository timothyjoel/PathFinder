//
//  Image.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 12/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

enum Image {
    
    case location
    case results
    
    func getImage(_ size: UIImage.SymbolScale) -> UIImage {
        let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold)
        switch self {
        case .location: return UIImage(systemName: "location", withConfiguration: configuration)!
        case .results: return UIImage(systemName: "magnifyingglass", withConfiguration: configuration)!
        }
    }
    
}
