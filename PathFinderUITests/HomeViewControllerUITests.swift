//
//  HomeViewControllerUITests.swift
//  PathFinderUITests
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import XCTest

class HomeViewControllerUITests: XCTestCase {
    
    let validLat1 = "51.402"
    let validLat2 = "28.107"
    let validLon1 = "21.304"
    let validLon2 = "132.605"
    var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDown() {
        app = nil
    }
    
    func test_WhenViewDidLoad_AllMutableUIElementsExists() {
        app.launch()
        XCTAssert(app.textFields["lat1field"].exists)
        XCTAssert(app.textFields["lat2field"].exists)
        XCTAssert(app.textFields["lon1field"].exists)
        XCTAssert(app.textFields["lon2field"].exists)
        XCTAssert(app.staticTexts["resultsStatusLabel"].exists)
        XCTAssert(app.staticTexts["location1Label"].exists)
        XCTAssert(app.staticTexts["location2Label"].exists)
        XCTAssert(app.staticTexts["kmLabel"].exists)
        XCTAssert(app.staticTexts["mLabel"].exists)
    }

    func test_WhenProvidedValidCoordinatesAndTappedGetDistance_DisplayResultsAndStatus() {
       
        let screen = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element

        let lat1Textfield = app.textFields["lat1field"]
        lat1Textfield.tap()
        validLat1.forEach { (value) in
            app.keys["\(value)"].tap()
        }
        
        let lon1Textfield = app.textFields["lon1field"]
        lon1Textfield.tap()
        validLon1.forEach { (value) in
            app.keys["\(value)"].tap()
        }
        
        let lat2field = app.textFields["lat2field"]
        lat2field.tap()
        app.buttons["-"].staticTexts["-"].tap()
        validLat1.forEach { (value) in
            app.keys["\(value)"].tap()
        }
        
        let lon2Textfield = app.textFields["lon2field"]
        lon2Textfield.tap()
        app.buttons["-"].staticTexts["-"].tap()
        validLon2.forEach { (value) in
            app.keys["\(value)"].tap()
        }
        
        screen.tap()
        app.buttons["GET DISTANCE"].tap()

        XCTAssertEqual(app.staticTexts["resultsStatusLabel"].label, "Coordinates filled correctly")
        XCTAssertEqual(app.staticTexts["kmLabel"].label, "18210.6")
        XCTAssertEqual(app.staticTexts["mLabel"].label, "18210627.9")
        XCTAssertTrue(app.staticTexts["82F, Klwatka Królewska, gmina Gózd, Radom County, Masovian Voivodeship, 26-634, Poland"].waitForExistence(timeout: 5))
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
