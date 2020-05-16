//
//  LabelTests.swift
//  PathFinderTests
//
//  Created by Timothy Stokarski on 16/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import XCTest
@testable import PathFinder

class LabelTests: XCTestCase {
    
    func test_InitializeWithCoder() {
        let coder = NSCoder()
        let sut = Label(coder: coder)
        XCTAssertNil(sut)
    }

}
