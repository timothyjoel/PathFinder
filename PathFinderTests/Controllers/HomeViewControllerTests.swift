//
//  HomeViewControllerTests.swift
//  PathFinderTests
//
//  Created by Timothy Stokarski on 15/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import XCTest
@testable import PathFinder

class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    var view: HomeView!

    override func setUp() {
        sut = HomeViewController()
        self.sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_WhenUserTapsGetDistanceButtonWithCoordinates_ShowDistanceAndStatusCorrect() {
        
        sut.viewModel.coordinates1 = Coordinates(lat: 40.0, lon: 40.0)
        sut.viewModel.coordinates2 = Coordinates(lat: 46.0, lon: 45.0)
        
        self.sut.getDistanceButtonTapped()
        XCTAssertEqual(self.sut.homeView.statusLabel.text, SearchLocationStatus.correct.message)
        XCTAssertEqual(self.sut.homeView.kmLabel.text, "781.0")
        XCTAssertEqual(self.sut.homeView.mLabel.text, "780975.6")
        
    }
    
    func test_WhenUserTapsGetDistanceButtonWithoutCoordinates_DontShowDistanceAndShowStatusIncorrect() {
        
        sut.viewModel.coordinates1 = Coordinates(lat: 40.0, lon: 40.0)
        sut.viewModel.coordinates2 = Coordinates(lat: 46.0, lon: nil)
        
        self.sut.getDistanceButtonTapped()
        XCTAssertEqual(self.sut.homeView.statusLabel.text, SearchLocationStatus.incorrect.message)
        XCTAssertEqual(self.sut.homeView.kmLabel.text, "-")
        XCTAssertEqual(self.sut.homeView.mLabel.text, "-")
        
    }
    
    func test_WhenUserTapsGetDistanceButtonWithValidCoordinates_LoadLocation() {
        sut.viewModel.coordinates1 = Coordinates(lat: 40.0, lon: 40.0)
        let coordinates = sut.viewModel.coordinates1
        let expectation = self.expectation(description: "HomeViewController expected response")
        
        self.sut.viewModel.getLocationFor(coordinates) { (location) in
            DispatchQueue.main.async {
                self.sut.homeView.location1Label.text = location
                XCTAssertEqual(self.sut.homeView.location1Label.text, "Otlukbeli, Erzincan, Eastern Anatolia Region, Turkey")
                expectation.fulfill()
            }
        }
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func test_WhenFinishedTextEditingWithValidCoordinates_SetCoordinatesValues() {
        
        sut.homeView.lat1field.text = "40.02"
        sut.homeView.lon1field.text = "50.04"
        sut.homeView.lat2field.text = "63.02"
        sut.homeView.lon2field.text = "44.04"
        sut.homeView.lat1field.validateInput()
        sut.homeView.lon1field.validateInput()
        sut.homeView.lat2field.validateInput()
        sut.homeView.lon2field.validateInput()
        sut.textFieldDidEndEditing(UITextField())
        
        XCTAssertEqual(sut.viewModel.coordinates1.lat, 40.02)
        XCTAssertEqual(sut.viewModel.coordinates1.lon, 50.04)
        XCTAssertEqual(sut.viewModel.coordinates2.lat, 63.02)
        XCTAssertEqual(sut.viewModel.coordinates2.lon, 44.04)
        
    }
    
    func test_WhenFinishedTextEditingWithNoCoordinates_SetNilValues() {
        
        sut.homeView.lat1field.text = ""
        sut.homeView.lon1field.text = ""
        sut.homeView.lat2field.text = ""
        sut.homeView.lon2field.text = ""
        sut.homeView.lat1field.validateInput()
        sut.homeView.lon1field.validateInput()
        sut.homeView.lat2field.validateInput()
        sut.homeView.lon2field.validateInput()
        sut.textFieldDidEndEditing(UITextField())
        
        XCTAssertEqual(sut.viewModel.coordinates1.lat, nil)
        XCTAssertEqual(sut.viewModel.coordinates1.lon, nil)
        XCTAssertEqual(sut.viewModel.coordinates2.lat, nil)
        XCTAssertEqual(sut.viewModel.coordinates2.lon, nil)
        
    }
    
    func test_WhenFinishedTextEditingWithInvalidCoordinates_SetNilValues() {
        
        sut.homeView.lat1field.text = "10000"
        sut.homeView.lon1field.text = "-.."
        sut.homeView.lat2field.text = "190.21"
        sut.homeView.lon2field.text = "921.0"
        sut.homeView.lat1field.validateInput()
        sut.homeView.lon1field.validateInput()
        sut.homeView.lat2field.validateInput()
        sut.homeView.lon2field.validateInput()
        sut.textFieldDidEndEditing(UITextField())
        
        XCTAssertEqual(sut.viewModel.coordinates1.lat, nil)
        XCTAssertEqual(sut.viewModel.coordinates1.lon, nil)
        XCTAssertEqual(sut.viewModel.coordinates2.lat, nil)
        XCTAssertEqual(sut.viewModel.coordinates2.lon, nil)
        
    }

}
