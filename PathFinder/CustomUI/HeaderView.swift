//
//  HeaderView.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 13/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    private var iconView = IconView()
    private var titleLabel = Label(font: .systemFont(ofSize: 16, weight: .bold), textColor: .flatBlack, alignment: .left)
    
    init(icon: Image, title: String) {
        self.iconView.imageView.image = icon.getImage(.small)
        self.titleLabel.text = title
        super.init(frame: .zero)
        addSubviews(iconView, titleLabel)
        setupLayout()
        setupBackground()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func setupLayout() {
        iconView.snp.makeConstraints { (make) in
            make.height.width.equalTo(60)
            make.leading.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(iconView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupBackground() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.layer.shadowColor = UIColor.flatBlack.cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.2
    }
    
}
