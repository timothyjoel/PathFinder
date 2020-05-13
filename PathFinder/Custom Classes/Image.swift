//
//  Image.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 12/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

enum Image {
    
    case map
    case location
    case results
    
    func getImage(_ size: UIImage.SymbolScale) -> UIImage {
        let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold)
        switch self {
        case .map: return UIImage(systemName: "map", withConfiguration: configuration) ?? UIImage()
        case .location: return UIImage(systemName: "location", withConfiguration: configuration) ?? UIImage()
        case .results: return UIImage(systemName: "magnifyingglass", withConfiguration: configuration) ?? UIImage()
        }
    }
}
