//
//  IconView.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class IconView: UIView {
    
    var imageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        self.addSubview(imageView)
        setupLayout()
        backgroundColor = .mainColor
        tintColor = .white
        layer.cornerRadius = 30
        self.layer.shadowColor = UIColor.mainColor.cgColor
        self.layer.shadowOffset = CGSize(width: -4, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(30)
            make.center.equalToSuperview()
        }
    }
}
