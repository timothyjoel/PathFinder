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
    
    let vm = HomeViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocationIncorrect() {
        vm.coordinates1 = Coordinates(lat: nil, lon: nil)
        vm.coordinates2 = Coordinates(lat: 4, lon: nil)
        XCTAssertFalse(vm.checkForDataCorrectness())
    }
    
    func testLocationCorrect() {
        vm.coordinates1 = Coordinates(lat: 50.0, lon: 10.0)
        vm.coordinates2 = Coordinates(lat: 40.2, lon: 42.0)
        XCTAssertTrue(vm.checkForDataCorrectness())
    }
    
    func testGetDistanceMeters() {
        vm.coordinates1 = Coordinates(lat: 50.0, lon: 10.0)
        vm.coordinates2 = Coordinates(lat: 40.2, lon: 42.0)
        XCTAssertEqual(vm.getDistanceBetweenLocations(in: .meters), "2717391.6")
    }
    
    func testGetDistanceKm() {
        vm.coordinates1 = Coordinates(lat: 50.0, lon: 10.0)
        vm.coordinates2 = Coordinates(lat: 40.2, lon: 42.0)
        XCTAssertEqual(vm.getDistanceBetweenLocations(in: .kilometers), "2717.4")
    }

}
