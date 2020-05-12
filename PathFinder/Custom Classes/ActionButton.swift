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
        setTitle(title, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.2
        self.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
