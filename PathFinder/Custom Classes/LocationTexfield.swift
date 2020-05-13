//
//  LocationTextfield.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SkyFloatingLabelTextField

class LocationTexfield: SkyFloatingLabelTextField {
    
    var value: Double?
    var validation: LocationParameter
    
    init(_ validation: LocationParameter) {
        self.validation = validation
        super.init(frame: .zero)
        self.placeholder = validation == .latitude ? "Latitude..." : "Longitude..."
        self.title = validation  == .latitude ? "Latitude" : "Longitude"
        self.selectedTitle = validation  == .latitude ? "Latitude" : "Longitude"
        self.titleColor = .flatBlack
        self.placeholderColor = UIColor.main2Color.withAlphaComponent(0.2)
        self.textColor = .flatBlack
        self.placeholder = placeholder
        self.errorColor = .main2Color
        self.lineColor = .flatBlack
        self.selectedLineColor = .flatBlack
        self.selectedTitleColor = .flatBlack
        self.selectedLineHeight = 1
        self.lineHeight = 1
        self.keyboardType = .decimalPad
        self.addTarget(self, action: #selector(validateInput), for: .editingDidEnd)
        setMinusButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func validateInput() {
        let lowerBound: Double = validation == .latitude ? -90.0 : -180.0
        let upperBound: Double = validation == .latitude ? 90.0 : 180.0
        guard self.text != "" else {
            self.value = nil
            self.errorMessage = nil
            return
        }
        guard let value = text?.double else {
            self.value = nil
            self.errorMessage = "Incorrect value"
            return
        }
        
        if value < lowerBound {
            self.errorMessage = "Value is too low"
            return
        }
        
        if value > upperBound {
            self.errorMessage = "Value is too high"
            return
        }
        
        self.errorMessage = nil
        self.text = String(value.rounded(toPlaces: 4))
        self.value = value.rounded(toPlaces: 4)
    }
    
    func setMinusButton() {
        let minus = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 50))
        minus.backgroundColor = .systemGray4
        minus.setTitle("-", for: .normal)
        minus.setTitleColor(.black, for: .normal)
        minus.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        inputAccessoryView = minus
    }
    
    @objc func minusButtonTapped() {
        guard let text = self.text else {
            return
        }
        if text.contains("-") {
            self.text?.removeFirst()
        } else {
            self.text?.insert("-", at: self.text!.startIndex)
        }
    }
    
}
