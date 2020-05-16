//
//  HeaderViewTests.swift
//  PathFinderTests
//
//  Created by Timothy Stokarski on 16/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

import XCTest
@testable import PathFinder

class HeaderViewTests: XCTestCase {
    
    func test_InitializeWithCoder() {
        let coder = NSCoder()
        let sut = HeaderView(coder: coder)
        XCTAssertNil(sut)
    }

}
