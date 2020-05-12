//
//  Validator.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 12/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

//import Foundation
//
enum LocationParameter {
    case longitude, latitude
}
//
//enum TextfieldValidator {
//    static func validate(_ text: String, parameter: LocationParameter, completion: (_ validated: Bool, _ text: String?, _ errorMessage: String? ) -> ()) {
//
//    }
//}
//
//protocol ValidatorConvertible {
//    func validate(_ text: String?) -> String?
//}
//
//class LongitudeValidator: ValidatorConvertible {
//    func validate(_ text: String?) -> String? {
//        guard let value = text?.double else {
//            return nil
//        }
//        if value <= 180.0 && value >= -180.0 {
//            return String(value.rounded(toPlaces: 4))
//        } else {
//            return nil
//        }
//    }
//}
//
//class LatitudeValidator: ValidatorConvertible {
//    func validate(_ text: String?) -> String? {
//        guard let value = text?.double else {
//            return nil
//        }
//        if value <= 90.0 && value >= -90.0 {
//            return String(value.rounded(toPlaces: 4))
//        } else {
//            return nil
//        }
//    }
//}
//
//enum Validator {
//    static func validation(of: LocationParameter) -> ValidatorConvertible {
//        switch of {
//        case .latitude: return LatitudeValidator()
//        case .longitude: return LongitudeValidator()
//        }
//    }
//
//}
