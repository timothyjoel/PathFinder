//
//  LocationWebServiceTests.swift
//  PathFinderTests
//
//  Created by Timothy Stokarski on 15/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import XCTest
@testable import PathFinder

class LocationWebServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_WhenSuccessfullResponse_ReturnFetchedLocation() {
        
        let sut = LocationWebService()
        let coordinates = Coordinates(lat: 45.0, lon: 50.0)
        let expectation = self.expectation(description: "LocationWebService response expectation")
        let testLocation = FetchedLocation(place_id: Optional(235315351), licence: Optional("Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright"), osm_type: Optional("relation"), osm_id: Optional(215686), lat: Optional("43.8568087"), lon: Optional("53.38512264812475"), place_rank: Optional(8), category: Optional("boundary"), type: Optional("administrative"), importance: Optional(0.5715771603855716), addresstype: Optional("boundary"), name: Optional("Mangystau Region"), display_name: Optional("Mangystau Region, Kazakhstan"), address: Optional(Address(road: nil, village: nil, state_district: nil, state: Optional("Mangystau Region"), postcode: nil, country: Optional("Kazakhstan"), country_code: Optional("kz"))), boundingbox: Optional(["41.246392", "46.5201311", "49.8082944", "56.744109"]))
        
        sut.search(coordinates) { fetchedLocation in
            XCTAssertEqual(testLocation.place_id, fetchedLocation.place_id)
            expectation.fulfill()
        }

        self.wait(for: [expectation], timeout: 5)
        
    }
    
}
