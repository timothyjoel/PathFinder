//
//  ActionButton.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class ActionButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title.uppercased(), for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        backgroundColor = .mainColor
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.mainColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.7
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
