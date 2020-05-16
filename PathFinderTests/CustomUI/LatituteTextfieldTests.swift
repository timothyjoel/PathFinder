//
//  LatituteTextfieldTests.swift
//  PathFinderTests
//
//  Created by Timothy Stokarski on 15/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import XCTest
@testable import PathFinder

class LatituteTextfieldTests: XCTestCase {
    
    var sut: CoordinateTextfield!

    override func setUp() {
        sut = CoordinateTextfield(.latitude)
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_WhenLatitudeProvidedIsTooLow_SetErrorMessage() {
        sut.text = "-90.0001"
        sut.validateInput()
        XCTAssertEqual(sut.errorMessage, "Value is too low")
    }
    
    func test_WhenLatitudeProvidedIsTooLow_SetValueToNil() {
        sut.text = "-90.0001"
        sut.validateInput()
        XCTAssertEqual(sut.coordinateValue, nil)
    }
    
    func test_WhenLatitudeProvidedIsTooHigh_SetErrorMessage() {
        sut.text = "90.0001"
        sut.validateInput()
        XCTAssertEqual(sut.errorMessage, "Value is too high")
    }
    
    func test_WhenLatitudeProvidedIsTooHigh_SetValueToNil() {
        sut.text = "90.0001"
        sut.validateInput()
        XCTAssertEqual(sut.coordinateValue, nil)
    }
    
    func test_WhenCorrectLatitudeIsProvided_SetValue() {
        sut.text = "80.0"
        sut.validateInput()
        XCTAssertEqual(sut.coordinateValue, 80.0)
    }
    
    func test_WhenAddingMinusToPositiveValue_SetTextWithNegativeSign() {
        sut.text = "65.038"
        sut.minusButtonTapped()
        XCTAssertEqual(sut.text, "-65.038")
    }
    
    func test_WhenAddingMinusToNegativeValue_SetTextWithPositiveSign() {
        sut.text = "-65.0382"
        sut.minusButtonTapped()
        XCTAssertEqual(sut.text, "65.0382")
    }
    
    func test_WhenAddingMinusToNilValue_SetTextToMinus() {
        sut.text = nil
        sut.minusButtonTapped()
        sut.validateInput()
        XCTAssertEqual(sut.text, "-")
    }
    
    func test_WhenAddingMinusToNilValue_SetValueToNil() {
        sut.text = nil
        sut.minusButtonTapped()
        sut.validateInput()
        XCTAssertEqual(sut.coordinateValue, nil)
    }
    
    func test_WhenTextIsNotDoubleConvertible_SetValueToNil() {
        sut.text = "-.-"
        sut.validateInput()
        XCTAssertEqual(sut.coordinateValue, nil)
    }
    
    func test_WhenTextIsNotDoubleConvertible_SetErrorMessage() {
        sut.text = "-.-"
        sut.validateInput()
        XCTAssertEqual(sut.errorMessage, "Invalid value")
    }
    
    func test_WhenTextIsEmpty_SetErrorMessageToNil() {
        sut.text = nil
        sut.validateInput()
        XCTAssertEqual(sut.errorMessage, nil)
    }
    
    func test_WhenTextIsEmpty_SetValueToNil() {
        sut.text = nil
        sut.validateInput()
        XCTAssertEqual(sut.coordinateValue, nil)
    }
    
}
