//
//  HomeViewController.swift
//  PathFinder
//
//  Created by Timothy Stokarski on 11/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.viewModel.location1 = Location(lat: homeView.lat1field.value, lon: homeView.lon1field.value)
        self.viewModel.location2 = Location(lat: homeView.lat2field.value, lon: homeView.lon2field.value)
        print(viewModel.location1)
        print(viewModel.location2)
    }
}

class HomeViewController: UIViewController {
    
    // MARK: - Properties
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setGradientBackground(colorTop: hexStringToUIColor(hex: "2e6eff"), colorBottom: hexStringToUIColor(hex: "003dc7"))
    }
    
    // MARK: - Functions
    @objc func getDistanceButtonTapped() {
        homeView.resultLabel.text = viewModel.getDistanceBetweenLocations()
    }
    
    @objc fileprivate func startStopButtonTapped() {
        
    }
    
    fileprivate func centerViewToUserLocation(center: CLLocationCoordinate2D) {
        
    }
    
    fileprivate func handleAuthorizationStatus(locationManager: CLLocationManager, status: CLAuthorizationStatus) {
        
    }
    
    fileprivate func mapRoute(destinationCoordinate: CLLocationCoordinate2D) {
        
    }
    
    fileprivate func getRouteSteps(route: MKRoute) {
        
    }
    
    func setDelegates() {
        [homeView.lat1field, homeView.lon1field, homeView.lat2field, homeView.lat1field].forEach { (textfield) in
            textfield.delegate = self
        }
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = homeView.bounds
        homeView.layer.insertSublayer(gradientLayer, at: 0)
    }

}
