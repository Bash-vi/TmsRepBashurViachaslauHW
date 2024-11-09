//
//  ViewController.swift
//  HW39CoreLocation&HW41MapKit
//
//  Created by Вячеслав Башур on 07/11/2024.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    lazy var stack = UIStackView()
    
    lazy var label = UILabel()
    
    lazy var button = UIButton(type: .system, primaryAction: .init(handler: { [weak self] _ in
        self?.actionButton() })
    )
    
    let locationManager = CLLocationManager()

    lazy var mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        label.textColor = .white
        label.numberOfLines = 0
        button.setTitle("Показать Координаты", for: .normal)
        button.tintColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        mapView.translatesAutoresizingMaskIntoConstraints = false
       
        view.addSubview(mapView)
        view.addSubview(stack)
        stack.addArrangedSubview(button)
        stack.addArrangedSubview(label)
        
        let mapViewHeight = view.bounds.height / 2
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalToConstant: mapViewHeight),
            
            stack.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        mapView.showsUserLocation = true
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func actionButton() {
        guard let coordinate = locationManager.location?.coordinate else { return }
        label.text = "latitude: \(coordinate.latitude); longitude: \(coordinate.longitude)"
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        mapView.setCenter(coordinate, animated: true)
        mapView.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 1500), animated: true)
    }
}
