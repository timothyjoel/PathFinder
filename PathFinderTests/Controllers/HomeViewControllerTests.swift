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
    var vm: HomeViewModel!

    override func setUp() {
        sut = HomeViewController()
        view = HomeView()
        vm = HomeViewModel()
        sut.view = view
    }

    override func tearDown() {
        sut = nil
        view = nil
    }

    func test_WhenUserTapsGetDistanceButtonWithoutCoordinates_ShowFailStatus() {
        sut.getDistanceButtonTapped()
        XCTAssertEqual(vm.getSearchLocationStatus(), SearchLocationStatus.failed.message)
    }
    
    func test_WhenUserTapsGetDistanceButtonWithCoordinates_ShowSucccessStatus() {
        vm.coordinates1 = Coordinates(lat: 40.0, lon: 40.0)
        vm.coordinates2 = Coordinates(lat: 46.0, lon: 49.0)
        sut.getDistanceButtonTapped()
        XCTAssertEqual(vm.getSearchLocationStatus(), SearchLocationStatus.success.message)
    }

}
