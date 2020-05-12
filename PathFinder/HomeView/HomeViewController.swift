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

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var homeView = HomeView()
    var homeViewModel = HomeViewModel()
    
    // MARK: - Lifecycle
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.getDistanceButton.addTarget(self, action: #selector(getDistanceButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setGradientBackground(colorTop: hexStringToUIColor(hex: "2e6eff"), colorBottom: hexStringToUIColor(hex: "003dc7"))
    }
    
    // MARK: - Functions
    @objc func getDistanceButtonTapped() {
  //      vm.getDistance(Location(lat: Double(homeView.lat1Textfield.text), lon: Double(homeView.lon1Textfield.text)), Location(lat: 50, lon: 50))
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

extension HomeViewController: UITextFieldDelegate {
    
}
