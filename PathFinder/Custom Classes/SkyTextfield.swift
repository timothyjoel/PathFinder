//
//  LocationTextfield.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SkyFloatingLabelTextField

class SkyTextfield: SkyFloatingLabelTextField {
    
    init(placeholder: String = "", mainColor: UIColor = .white, title: String = "") {
        super.init(frame: .zero)
        self.placeholderColor = mainColor.withAlphaComponent(0.2)
        self.textColor = mainColor
        self.placeholder = placeholder
        self.errorColor = .systemRed
        self.lineColor = mainColor
        self.selectedLineColor = mainColor
        self.titleColor = mainColor
        self.selectedTitleColor = mainColor
        self.selectedLineHeight = 1
        self.lineHeight = 1
        self.title = title
        self.selectedTitle = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
