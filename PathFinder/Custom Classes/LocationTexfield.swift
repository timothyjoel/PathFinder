//
//  LocationTextfield.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SkyFloatingLabelTextField

enum LocationParameter {
    case longitude, latitude
}

class LocationTexfield: SkyFloatingLabelTextField {
    
    var parameter: LocationParameter = .longitude
    
    init(_ parameter: LocationParameter) {
        super.init(frame: .zero)
        self.parameter = parameter
        self.placeholder = parameter == .latitude ? "Latitude..." : "Longitude..."
        self.title = parameter  == .latitude ? "Latitude" : "Longitude"
        self.selectedTitle = parameter  == .latitude ? "Latitude" : "Longitude"
        self.titleColor = .white
        self.delegate = self
        self.placeholderColor = UIColor.white.withAlphaComponent(0.2)
        self.textColor = .white
        self.placeholder = placeholder
        self.errorColor = .systemRed
        self.lineColor = .white
        self.selectedLineColor = .white
        self.selectedTitleColor = .white
        self.selectedLineHeight = 1
        self.lineHeight = 1
        self.keyboardType = .decimalPad
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isValidated() -> Bool {
        switch parameter {
        case .latitude: return validateLatitude()
        case .longitude: return validateLongitude()
        }
    }
    
    func validateLatitude() -> Bool {
        let value = self.text?.double ?? 0
        if value <= 90.0 && value >= -90.0 {
            return true
        } else {
            return false
        }
    }
    
    func validateLongitude() -> Bool {
        let value = self.text?.double ?? 0
        if value <= 180.0 && value >= -180.0 {
            return true
        } else {
            return false
        }
    }
    
    func formatInput() {
        let value = self.text?.double ?? 0
        if value != 0 {
           self.text = String(value.rounded(toPlaces: 4))
        }
    }
    
    func showError() {
        self.text = ""
        self.errorMessage = "Wrong value"
    }
    
}

extension LocationTexfield: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.isValidated() ? formatInput() : showError()
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.errorMessage = nil
    }
}

