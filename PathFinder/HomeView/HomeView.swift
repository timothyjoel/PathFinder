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
    var mainStack = Stack(axis: .vertical, distribution: .fill, alignment: .center)
    var infoLabel = Label(text: "Set location of two points to check the distance between them", font: .systemFont(ofSize: 17, weight: .semibold), textColor: .white)
    var mapImage = Image(image: .map)
    
    private var parametersStack = Stack(axis: .horizontal, distribution: .fill, alignment: .center)
    private var location1Stack = Stack(axis: .vertical, distribution: .fill, alignment: .leading)
    var lat1Textfield = LocationTexfield(placeholder: "latitude...", mainColor: .white, title: "Latitude")
    var lon1Textfield = LocationTexfield(placeholder: "longitude..", mainColor: .white, title: "Longitude")
    private var location2Stack = Stack(axis: .vertical, distribution: .fill, alignment: .leading)
    var lat2Textfield = LocationTexfield(placeholder: "latitude...", mainColor: .white, title: "Latitude")
    var lon2Textfield = LocationTexfield(placeholder: "longitude...", mainColor: .white, title: "Longitude")
    
    var resultLabel = Label(text: "Result", font: .systemFont(ofSize: 17, weight: .regular), textColor: .white)
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    func addViews() {
        addSubviews(mainStack, mapView)
        mainStack.addArrangedSubviews(infoLabel, mapImage, parametersStack, getDistanceButton, resultLabel)
        parametersStack.addArrangedSubviews(location1Stack, location2Stack)
        location1Stack.addArrangedSubviews(lon1Textfield, lat1Textfield)
        location2Stack.addArrangedSubviews(lon2Textfield, lat2Textfield)
    }
    
    override func updateConstraints() {
        let offset: CGFloat = 16
        mainStack.spacing = offset
        mainStack.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(offset)
            make.leading.equalToSuperview().offset(offset)
            make.trailing.equalToSuperview().offset(-offset)
        }
        
        mapImage.snp.makeConstraints { (make) in
            make.height.width.equalTo(50)
        }
        
        parametersStack.spacing = offset
        [location1Stack, location2Stack].forEach { (stack) in
            stack.spacing = offset
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
        
        super.updateConstraints()
    }
    
}
