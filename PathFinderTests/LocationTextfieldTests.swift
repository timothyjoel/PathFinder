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
        XCTAssertEqual(lon.errorMessage, "Incorrect value")
    }
    
    func testLongitudeValidationTooLowValue() {
        lon.text = "-181.0"
        lon.validateInput()
        XCTAssertEqual(lon.errorMessage, "Incorrect value")
    }
//
//    func testLongitudeValidationInRange() {
//        longitude.text = "90.0"
//        XCTAssertTrue(longitude.isValidated())
//    }
//
//    func testLatitudeValidationUpperBound() {
//        latitude.text = "91.0"
//        XCTAssertFalse(latitude.isValidated())
//    }
//
//    func testLatitudeValidationLowerBound() {
//        latitude.text = "-91.0"
//        XCTAssertFalse(latitude.isValidated())
//    }
//
//    func testLatitudeValidationInRange() {
//        latitude.text = "45.0"
//        XCTAssertTrue(latitude.isValidated())
//    }
//
//    func testFormattingValue1() {
//        latitude.text = "45.08013"
//        latitude.formatInput()
//        XCTAssertEqual(latitude.text, "45.0801")
//    }
//
//    func testFormattingValue2() {
//        latitude.text = "45.08"
//        latitude.formatInput()
//        XCTAssertEqual(latitude.text, "45.08")
//    }
    

}
