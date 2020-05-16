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
        self.sut.loadView()
        self.sut.viewDidLoad()
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_WhenUserTapsGetDistanceButtonWithCoordinates_ShowDistanceAndStatusCorrect() {
        
        sut.viewModel.coordinates1 = Coordinates(lat: 40.0, lon: 40.0)
        sut.viewModel.coordinates2 = Coordinates(lat: 46.0, lon: 45.0)
        
        self.sut.getDistanceButtonTapped()
        XCTAssertEqual(self.sut.homeView.resultsStatusLabel.text, SearchLocationStatus.correct.message)
        XCTAssertEqual(self.sut.homeView.kmLabel.text, "781.0")
        XCTAssertEqual(self.sut.homeView.mLabel.text, "780975.6")
        
    }
    
    func test_WhenUserTapsGetDistanceButtonWithoutCoordinates_DontShowDistanceAndShowStatusIncorrect() {
        
        sut.viewModel.coordinates1 = Coordinates(lat: 40.0, lon: 40.0)
        sut.viewModel.coordinates2 = Coordinates(lat: 46.0, lon: nil)
        
        self.sut.getDistanceButtonTapped()
        XCTAssertEqual(self.sut.homeView.resultsStatusLabel.text, SearchLocationStatus.incorrect.message)
        XCTAssertEqual(self.sut.homeView.kmLabel.text, "-")
        XCTAssertEqual(self.sut.homeView.mLabel.text, "-")
        
    }

}
