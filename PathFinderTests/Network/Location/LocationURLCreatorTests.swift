//
//  LocationURLCreatorTests.swift
//  PathFinderTests
//
//  Created by Timothy Stokarski on 15/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import XCTest
@testable import PathFinder

class LocationURLCreatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_WhenProvidedValidCoordinates_ReturnValidURL() {
        
        let sut = LocationURLCreator()
        let coordinates = Coordinates(lat: 45.0, lon: 50.0)
        let expectedURL = URL(string: "https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=45.0&lon=50.0")
        let url = sut.createURL(for: coordinates)
        XCTAssertEqual(url, expectedURL)
        
    }
    
    func test_WhenProvidedInvalidCoordinates_ReturnValidURLWithDefaultValues() {
        
        let sut = LocationURLCreator()
        let coordinates = Coordinates(lat: nil, lon: nil)
        let expectedURL = URL(string: "https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=0.0&lon=0.0")
        let url = sut.createURL(for: coordinates)
        XCTAssertEqual(url, expectedURL)
        
    }
    
}
