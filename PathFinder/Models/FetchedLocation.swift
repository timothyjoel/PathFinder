//
//  FetchedLocation.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import Foundation

struct FetchedLocation: Codable {
    let place_id: Int?
    let licence: String?
    let osm_type: String?
    let osm_id: Int?
    let lat: String?
    let lon: String?
    let place_rank: Int?
    let category: String?
    let type: String?
    let importance: Double?
    let addresstype: String?
    let name: String?
    let display_name: String?
    let address: Address?
    let boundingbox : [String]?

    enum CodingKeys: String, CodingKey {
        case place_id = "place_id"
        case licence = "licence"
        case osm_type = "osm_type"
        case osm_id = "osm_id"
        case lat = "lat"
        case lon = "lon"
        case place_rank = "place_rank"
        case category = "category"
        case type = "type"
        case importance = "importance"
        case addresstype = "addresstype"
        case name = "name"
        case display_name = "display_name"
        case address = "address"
        case boundingbox = "boundingbox"
    }

}

struct Address : Codable {
    let road : String?
    let village : String?
    let state_district : String?
    let state : String?
    let postcode : String?
    let country : String?
    let country_code : String?

    enum CodingKeys: String, CodingKey {
        case road = "road"
        case village = "village"
        case state_district = "state_district"
        case state = "state"
        case postcode = "postcode"
        case country = "country"
        case country_code = "country_code"
    }

}
