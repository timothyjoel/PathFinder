//
//  HomeView.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit
import MapKit
import SkyFloatingLabelTextField
import SnapKit

class HomeView: UIView {
    
    // MARK: - Properties
    private var mainStack = Stack(axis: .vertical, distribution: .fill)
    
    private var location1Header = HeaderView(icon: .location, title: "Location 1")
    private var location1Stack = Stack(axis: .horizontal)
    var lat1field = LocationTexfield(.latitude)
    var lon1field = LocationTexfield(.longitude)
    
    private var location2Header = HeaderView(icon: .location, title: "Location 2")
    private var location2Stack = Stack(axis: .horizontal)
    var lat2field = LocationTexfield(.latitude)
    var lon2field = LocationTexfield(.longitude)
    
    var resultsHeader = HeaderView(icon: .results, title: "Results")
    var resultInfoLabel = Label(text: "Fill in all the fields", font: .systemFont(ofSize: 14, weight: .bold))
    
    private var resultsStack = Stack(axis: .vertical)
    private var kmStaticLabel = Label(text: "Distance in km:", font: .systemFont(ofSize: 14, weight: .bold))
    var kmLabel = Label(text: "-", font: .systemFont(ofSize: 14, weight: .regular))
    private var mStaticLabel = Label(text: "Distance in m:", font: .systemFont(ofSize: 14, weight: .bold))
    var mLabel = Label(text: "-", font: .systemFont(ofSize: 14, weight: .regular))
    private var startStaticLabel = Label(text: "Location 1:", font: .systemFont(ofSize: 14, weight: .bold))
    var startLabel = Label(text: "-", font: .systemFont(ofSize: 14, weight: .regular))
    private var destinationStaticLabel = Label(text: "Location 2:", font: .systemFont(ofSize: 14, weight: .bold))
    var destinationLabel = Label(text: "-", font: .systemFont(ofSize: 14, weight: .regular))
    
    var getDistanceButton = ActionButton(title: "Get distance".uppercased())
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        backgroundColor = .background
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    func addViews() {
        addSubviews(mainStack, getDistanceButton)
        mainStack.addArrangedSubviews(location1Header, location1Stack, location2Header, location2Stack, resultsHeader, resultInfoLabel, resultsStack)
        location1Stack.addArrangedSubviews(lat1field, lon1field)
        location2Stack.addArrangedSubviews(lat2field, lon2field)
        resultsStack.addArrangedSubviews(kmStaticLabel, kmLabel, mStaticLabel, mLabel, startStaticLabel, startLabel, destinationStaticLabel, destinationLabel)
    }
    
    func setSpacings() {
        let spacing: CGFloat = 24
        [mainStack, location1Stack, location2Stack].forEach { (stack) in
            stack.spacing = spacing
        }
        resultsStack.spacing = 4
        resultsStack.isLayoutMarginsRelativeArrangement = true
        resultsStack.layoutMargins = UIEdgeInsets(top: -4, left: 0, bottom: 0, right: 0)
    }
    
    override func updateConstraints() {
        let offset: CGFloat = 12
        
        mainStack.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(offset)
            make.leading.equalToSuperview().offset(offset)
            make.trailing.equalToSuperview().offset(-offset)
        }
        
        [location1Stack, location2Stack].forEach { (stack) in
            stack.isLayoutMarginsRelativeArrangement = true
            stack.layoutMargins = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
        }
        
        [location1Header, location2Header, resultsHeader].forEach { (header) in
            header.snp.makeConstraints { (make) in
                make.height.equalTo(40)
                make.width.equalTo(150)
            }
        }
        
        [lat1field, lat2field, lon1field, lon2field].forEach { (textfield) in
            textfield.snp.makeConstraints { (make) in
                make.width.equalTo(140)
            }
        }
        
        getDistanceButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-offset)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        setSpacings()
        super.updateConstraints()
    }
    
}
