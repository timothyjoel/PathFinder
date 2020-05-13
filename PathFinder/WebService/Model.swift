//
//  Model.swift
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

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        place_id = try values.decodeIfPresent(Int.self, forKey: .place_id)
        licence = try values.decodeIfPresent(String.self, forKey: .licence)
        osm_type = try values.decodeIfPresent(String.self, forKey: .osm_type)
        osm_id = try values.decodeIfPresent(Int.self, forKey: .osm_id)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lon = try values.decodeIfPresent(String.self, forKey: .lon)
        place_rank = try values.decodeIfPresent(Int.self, forKey: .place_rank)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        importance = try values.decodeIfPresent(Double.self, forKey: .importance)
        addresstype = try values.decodeIfPresent(String.self, forKey: .addresstype)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
        address = try values.decodeIfPresent(Address.self, forKey: .address)
        boundingbox = try values.decodeIfPresent([String].self, forKey: .boundingbox)
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

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        road = try values.decodeIfPresent(String.self, forKey: .road)
        village = try values.decodeIfPresent(String.self, forKey: .village)
        state_district = try values.decodeIfPresent(String.self, forKey: .state_district)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
    }

}
