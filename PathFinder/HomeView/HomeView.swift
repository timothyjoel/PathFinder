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
    
    var infoLabel = Label(text: "Set locaction of two points on the map to check the distance between them", font: .systemFont(ofSize: 17, weight: .semibold), textColor: .yellow)
    
    private var mainStack = Stack(axis: .horizontal, distribution: .fill, alignment: .center, spacing: 0)
    
    private var stack1 = Stack(axis: .vertical, distribution: .fill, alignment: .leading, spacing: 0)
    private var location1Label = Label(text: "Location1", font: .systemFont(ofSize: 17, weight: .regular), textColor: .systemGreen)
    var lat1Textfield = LocationTextfield(placeholder: "latitude...")
    var lon1Textfield = LocationTextfield(placeholder: "longitude...")
    
    private var stack2 = Stack(axis: .vertical, distribution: .fill, alignment: .leading, spacing: 0)
    private var location2Label = Label(text: "Location2", font: .systemFont(ofSize: 17, weight: .regular), textColor: .systemGreen)
    var lat2Textfield = LocationTextfield(placeholder: "latitude...")
    var lon2Textfield = LocationTextfield(placeholder: "longitude...")
    
    var resultLabel = Label(text: "Result", font: .systemFont(ofSize: 17, weight: .regular), textColor: .systemGreen)
    
    var getDistanceButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get distance", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemTeal
        return button
    }()
    
//    lazy var startStopButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Start Navigation", for: .normal)
//        button.setTitleColor(.systemBlue, for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
//    //   button.addTarget(self, action: #selector(startStopButtonTapped), for: .touchUpInside)
//        return button
//    }()
//
    var mapView = MKMapView()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubViews(infoLabel, mainStack, resultLabel, getDistanceButton, mapView)
        mainStack.addArrangedSubviews(stack1, stack2)
        stack1.addArrangedSubviews(location1Label, lon1Textfield, lat1Textfield)
        stack2.addArrangedSubviews(location2Label, lon2Textfield, lat2Textfield)
    }
    
    override func updateConstraints() {
        let offset = 16
        infoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(offset)
            make.leading.equalToSuperview().offset(offset)
            make.trailing.equalToSuperview().offset(-offset)
        }
        mainStack.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(offset)
            make.centerX.equalToSuperview()
        }
        [stack1, stack2].forEach { (stack) in
            stack.arrangedSubviews.forEach { (subview) in
                subview.snp.makeConstraints { (make) in
                    make.width.equalTo(160)
               //     make.height.equalTo(50)
                }
            }
        }
        

        getDistanceButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(mainStack.snp.bottom).offset(offset)
        }

        resultLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(getDistanceButton.snp.bottom).offset(offset)
        }

        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(resultLabel.snp.bottom).offset(offset)
            make.bottom.leading.trailing.equalToSuperview()
        }
        mapView.layer.cornerRadius = 16
        
        super.updateConstraints()
    }
    
    
}
