//
//  HomeViewController.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
   
    var homeView = HomeView()
    var viewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
        homeView.getDistanceButton.addTarget(self, action: #selector(getDistanceButtonTapped), for: .touchUpInside)
        setDelegates()
    }
    
    // MARK: - Functions
    @objc func getDistanceButtonTapped() {
        self.view.endEditing(true)
        homeView.statusLabel.text = viewModel.resultStatus
        homeView.statusLabel.textColor = viewModel.statusColor
        homeView.kmLabel.text = viewModel.distanceInKm
        homeView.mLabel.text = viewModel.distanceInM
        viewModel.getLocationFor(viewModel.coordinates1) { [weak self] location in
            DispatchQueue.main.async {
                self?.homeView.location1Label.text = location
            }
        }
        viewModel.getLocationFor(viewModel.coordinates2) { [weak self] location in
            DispatchQueue.main.async {
                self?.homeView.location2Label.text = location
            }
        }
        
    }
    
    func setDelegates() {
        [homeView.lat1field, homeView.lon1field, homeView.lon2field, homeView.lat2field].forEach { (textfield) in
            textfield.delegate = self
        }
    }

}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.viewModel.coordinates1 = Coordinates(lat: homeView.lat1field.coordinateValue, lon: homeView.lon1field.coordinateValue)
        self.viewModel.coordinates2 = Coordinates(lat: homeView.lat2field.coordinateValue, lon: homeView.lon2field.coordinateValue)
    }
    
}
