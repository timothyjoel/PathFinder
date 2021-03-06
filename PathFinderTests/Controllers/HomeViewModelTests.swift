//
//  HomeViewModelTests.swift
//  PathFinderTests
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import XCTest
@testable import PathFinder

class HomeViewModelTests: XCTestCase {
    
    var vm: HomeViewModel!

    override func setUp() {
        vm = HomeViewModel()
    }

    override func tearDown() {
        vm = nil
    }
    
    func test_WhenCoordinatesAreCorrect_SetDistanceInMeters() {
        vm.coordinates1 = Coordinates(lat: 50.0, lon: 10.0)
        vm.coordinates2 = Coordinates(lat: 40.2, lon: 42.0)
        XCTAssertEqual(vm.distanceInM, "2717391.6")
    }
    
    func test_WhenCoordinatesAreCorrect_SetDistanceInKilometers() {
        vm.coordinates1 = Coordinates(lat: 50.0, lon: 10.0)
        vm.coordinates2 = Coordinates(lat: 40.2, lon: 42.0)
        XCTAssertEqual(vm.distanceInKm, "2717.4")
    }
    
    func test_WhenCoordinatesAreIncorrect_SetDistanceToMinus() {
        vm.coordinates1 = Coordinates(lat: 50.0, lon: nil)
        vm.coordinates2 = Coordinates(lat: nil, lon: 42.0)
        XCTAssertEqual(vm.distanceInM, "-")
    }
    
    func test_WhenCoordinatesAreIncorrect_LocationSearchReturnsMinus() {
        vm.coordinates1 = Coordinates(lat: nil, lon: nil)
        let expectedLocation = "-"
        
        vm.getLocationFor(vm.coordinates1) { (location) in
                XCTAssertEqual(expectedLocation, location)
        }
    }
    
    func test_WhenCoordinatesAreCorrect_LocationSearchReturnLocation() {
        vm.coordinates1 = Coordinates(lat: 50.8, lon: 54.7)
        let expectedLocation = "Kobda District, Aktobe Region, Kazakhstan"
        let expectation = self.expectation(description: "HomeViewModel response expectation")
        
        vm.getLocationFor(vm.coordinates1) { (location) in
            DispatchQueue.main.async {
                XCTAssertEqual(expectedLocation, location)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func test_WhenCoordinatesAreCorrect_LocationSearchReturnUnkownLocation() {
        vm.coordinates1 = Coordinates(lat: -21.0, lon: 78.0)
        let expectedLocation = "Unknown location"
        let expectation = self.expectation(description: "HomeViewModel response expectation")
        
        vm.getLocationFor(vm.coordinates1) { (location) in
            DispatchQueue.main.async {
                XCTAssertEqual(expectedLocation, location)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }

}
