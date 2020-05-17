//
//  LocationTextfield.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SkyFloatingLabelTextField

class CoordinateTextfield: SkyFloatingLabelTextField {
    
    let coordinateParameter: CoordinateParameter
    var coordinateValue: Double?
    
    init(_ coordinateParameter: CoordinateParameter) {
        self.coordinateParameter = coordinateParameter
        super.init(frame: .zero)
        self.placeholder = coordinateParameter.name + "..."
        self.title = coordinateParameter.name
        self.selectedTitle = coordinateParameter.name
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
        return nil
    }
}

extension CoordinateTextfield {
    
    // MARK: - Selectors
    @objc func minusButtonTapped() {
        if let text = self.text {
            if text.contains("-") {
                self.text?.removeFirst()
            } else {
                self.text?.insert("-", at: self.text!.startIndex)
            }
        }
    }
    
    func setMinusButton() {
        let minus = UIButton(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 50))
        minus.backgroundColor = .systemGray4
        minus.setTitle("-", for: .normal)
        minus.setTitleColor(.label, for: .normal)
        minus.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        inputAccessoryView = minus
    }
    
    @objc func validateInput() {
        self.coordinateValue = setCoordinateValue()
        self.errorMessage = setErrorMessage()
        setFormattedInputText()
    }
    
    func setCoordinateValue() -> Double? {
        guard let val = self.text?.double else {
            return nil
        }
        switch val {
            case coordinateParameter.lowerLimit...coordinateParameter.upperLimit : return val.rounded(toPlaces: 4)
        default: return nil
        }
    }
    
    func setErrorMessage() -> String? {
        guard self.text != "" else {
            return nil
        }
        guard let val = self.text?.double else {
            return CoordinateTextfieldError.valueIsInvalid.message
        }
        switch val {
            case coordinateParameter.lowerLimit...coordinateParameter.upperLimit : return nil
            case coordinateParameter.upperLimit... : return CoordinateTextfieldError.valueIsTooHigh.message
            case ...coordinateParameter.lowerLimit : return CoordinateTextfieldError.valueIsTooLow.message
        default: return nil
        }
    }
    
    func setFormattedInputText() {
        guard let val = self.text?.double else {
            return
        }
        self.text = String(val.rounded(toPlaces: 4))
    }
    
}
