//
//  Ext-HTTPResponse.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 16/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    
    var isResponseOK: Bool {
        return (200...299).contains(self.statusCode)
    }
    
}
