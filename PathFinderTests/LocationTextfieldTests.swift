//
//  LocationTextfieldTests.swift
//  PathFinderTests
//
//  Created by Timothy Stokarski on 12/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import XCTest
@testable import PathFinder

class LocationTextfieldTests: XCTestCase {

    let lon = LocationTexfield(.longitude)
    let lat = LocationTexfield(.latitude)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLongitudeValidationTooHighValue() {
        lon.text = "181.0"
        lon.validateInput()
        XCTAssertEqual(lon.errorMessage, "Value is too high")
    }
    
    func testLongitudeValidationTooLowValue() {
        lon.text = "-181.0"
        lon.validateInput()
        XCTAssertEqual(lon.errorMessage, "Value is too low")
    }
    
    func testLongitudeValidationValueCorrect() {
        lon.text = "94"
        lon.validateInput()
        XCTAssertEqual(lon.errorMessage, nil)
    }
    
    func testLatitudeValidationTooHighValue() {
        lat.text = "91.0"
        lat.validateInput()
        XCTAssertEqual(lat.errorMessage, "Value is too high")
    }
    
    func testLatitudeValidationTooLowValue() {
        lat.text = "-91.0"
        lat.validateInput()
        XCTAssertEqual(lat.errorMessage, "Value is too low")
    }
    
    func testLatitudeValidationValueCorrect() {
        lat.text = "65.91029"
        lat.validateInput()
        XCTAssertEqual(lat.errorMessage, nil)
        XCTAssertEqual(lat.text, "65.9103")
    }
    
    func testAddingMinus() {
        lat.text = "65.0382"
        lat.minusButtonTapped()
        XCTAssertEqual(lat.text, "-65.0382")
    }

}
