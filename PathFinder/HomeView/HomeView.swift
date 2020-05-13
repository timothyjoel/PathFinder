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
    var mainStack = Stack(axis: .vertical, distribution: .fill)
    
    private var parametersStack = Stack(axis: .horizontal)
    private var location1Stack = Stack(axis: .vertical)
    var lat1field = LocationTexfield(.latitude)
    var lon1field = LocationTexfield(.longitude)
    private var location2Stack = Stack(axis: .vertical)
    var lat2field = LocationTexfield(.latitude)
    var lon2field = LocationTexfield(.longitude)
    
    var resultInfoLabel = Label(text: "Fill in all the fields", font: .systemFont(ofSize: 14, weight: .bold))
    
    private var resultsDistanceStack = Stack(axis: .horizontal)
    private var kmStack = Stack(axis: .vertical)
    private var kmStaticLabel = Label(text: "km:", font: .systemFont(ofSize: 14, weight: .bold))
    var kmLabel = Label(text: "-", font: .systemFont(ofSize: 14, weight: .regular))
    private var mStaticLabel = Label(text: "m:", font: .systemFont(ofSize: 14, weight: .bold))
    private var mStack = Stack(axis: .vertical)
    var mLabel = Label(text: "-", font: .systemFont(ofSize: 14, weight: .regular))
    
    private var resultsLocationsStack = Stack(axis: .horizontal)

    private var startLocationStack = Stack(axis: .vertical)
    private var startStaticLabel = Label(text: "Start:", font: .systemFont(ofSize: 14, weight: .bold))
    var startLabel = Label(text: "-", font: .systemFont(ofSize: 14, weight: .regular))

    private var destinationLocationStack = Stack(axis: .vertical)
    private var destinationStaticLabel = Label(text: "Destination:", font: .systemFont(ofSize: 14, weight: .bold))
    var destinationLabel = Label(text: "-", font: .systemFont(ofSize: 14, weight: .regular))
    
    var getDistanceButton = ActionButton(title: "Get distance".uppercased())
    
    var mapView: MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = 16
        return map
    }()
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        addViews()
      //  setSpacings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    func addViews() {
        addSubviews(mainStack, mapView)
        mainStack.addArrangedSubviews(resultInfoLabel, parametersStack, resultsDistanceStack, resultsLocationsStack, getDistanceButton)
        parametersStack.addArrangedSubviews(location1Stack, location2Stack)
        location1Stack.addArrangedSubviews(lon1field, lat1field)
        location2Stack.addArrangedSubviews(lon2field, lat2field)
        resultsDistanceStack.addArrangedSubviews(kmStack, mStack)
        kmStack.addArrangedSubviews(kmStaticLabel, kmLabel)
        mStack.addArrangedSubviews(mStaticLabel, mLabel)
        resultsLocationsStack.addArrangedSubviews(startLocationStack, destinationLocationStack)
        startLocationStack.addArrangedSubviews(startStaticLabel, startLabel)
        destinationLocationStack.addArrangedSubviews(destinationStaticLabel, destinationLabel)
    }
    
    func setSpacings() {
        let spacing: CGFloat = 16
        [mainStack, parametersStack, location1Stack, location2Stack].forEach { (stack) in
            stack.spacing = spacing
        }
        [kmStack, mStack].forEach { (stack) in
            stack.spacing = 0
        }
    }
    
    override func updateConstraints() {
        let offset: CGFloat = 16
        
        mainStack.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(offset)
            make.leading.equalToSuperview().offset(offset)
            make.trailing.equalToSuperview().offset(-offset)
        }
    
        [location1Stack, location2Stack, kmStack, mStack, startLocationStack, destinationLocationStack].forEach { (stack) in
            stack.arrangedSubviews.forEach { (subview) in
                subview.snp.makeConstraints { (make) in
                    make.width.equalTo(160)
                }
            }
        }
        getDistanceButton.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
        }

        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(mainStack.snp.bottom).offset(offset)
            make.bottom.leading.trailing.equalToSuperview()
        }
        setSpacings()
        super.updateConstraints()
    }
    
}
