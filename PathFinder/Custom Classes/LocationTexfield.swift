//
//  LocationTextfield.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SkyFloatingLabelTextField

class LocationTexfield: SkyFloatingLabelTextField {
    
    var validation: LocationParameter
    
    init(_ validation: LocationParameter) {
        self.validation = validation
        super.init(frame: .zero)
        self.placeholder = validation == .latitude ? "Latitude..." : "Longitude..."
        self.title = validation  == .latitude ? "Latitude" : "Longitude"
        self.selectedTitle = validation  == .latitude ? "Latitude" : "Longitude"
        self.titleColor = .white
        self.placeholderColor = UIColor.white.withAlphaComponent(0.2)
        self.textColor = .white
        self.placeholder = placeholder
        self.errorColor = .systemRed
        self.lineColor = .white
        self.selectedLineColor = .white
        self.selectedTitleColor = .white
        self.selectedLineHeight = 1
        self.lineHeight = 1
        self.delegate = self
        self.keyboardType = .decimalPad
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LocationTexfield {
    
    func validateInput() {
        let lowerBound: Double = validation == .latitude ? -90.0 : -180.0
        let upperBound: Double = validation == .latitude ? 90.0 : 180.0
        guard let value = text?.double else {
            errorMessage = nil
            return
        }
        if value >= lowerBound && value <= upperBound {
            errorMessage = nil
            self.text = String(value.rounded(toPlaces: 4))
        } else {
            errorMessage = "Wrong value"
        }
    }

}

extension LocationTexfield: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        validateInput()
    }
    
}

