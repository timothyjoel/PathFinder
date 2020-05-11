//
//  Image.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 12/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class Image: UIImageView {
    
    init(image: Images) {
        super.init(frame: .zero)
        self.image = image.getImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

enum Images {
    
    case map
    
    func getImage() -> UIImage {
        switch self {
        case .map: return UIImage(named: "map") ?? UIImage()
        }
    }
}
