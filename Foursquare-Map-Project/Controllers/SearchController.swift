//
//  SearchController.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

private let cellIdentifier = "mapCell"

class SearchController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
//    MARK: -Properties

    private let locationManager = CLLocationManager()
   // let mapView = MKMapView(frame: UIScreen.main.bounds)
    let initialLocation = CLLocation(latitude: 40.742054, longitude: -73.769417)
    let searchRadius: CLLocationDistance = 2000
       
    
    lazy var querySearchBar1: UISearchBar = {
    let sb =  UISearchBar()
        sb.placeholder = "Search Venue"
        sb.searchBarStyle = UISearchBar.Style.prominent
        sb.backgroundColor = .systemTeal
        sb.isTranslucent = false
        sb.sizeToFit()
        sb.delegate = self
        return sb
    }()
  
    lazy var locationSearchBar2: UISearchBar = {
    let sb =  UISearchBar()
        sb.placeholder = "Enter Location"
        sb.searchBarStyle = UISearchBar.Style.prominent
        sb.backgroundColor = .systemOrange
        sb.isTranslucent = false
        sb.sizeToFit()
        sb.delegate = self
        return sb
    }()
    
    lazy var mapView: MKMapView = {
        let mv = MKMapView()
        return mv
    }()
    
    //ADD A LAZY VAR BAR BUTTON ITEM/ NAVIGATION BUTTON ITEM
    
    lazy var foodCollectionView: UICollectionView = {
    var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
    //let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    layout.itemSize = CGSize(width: 175, height: 175)
    layout.scrollDirection = .horizontal
    cv.backgroundColor = .clear
    cv.register(mapCell.self, forCellWithReuseIdentifier: cellIdentifier)
    //cv.layer.borderColor = UIColor.black.cgColor
   // cv.layer.borderWidth = 2
    //cv.layer.cornerRadius = 20
    cv.delegate = self
    cv.dataSource = self
    return cv 
    }()
    
  
    
    var venueData = [Venue](){
           didSet{
               foodCollectionView.reloadData()
           }
       }
       
    private func requestLocationAndAuthorizeIfNeeded() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
   
    
 //MARK: -Life-Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8939689994, green: 1, blue: 0.8997142911, alpha: 1)
        self.view.addSubview(mapView)
        view.addSubview(foodCollectionView)
        addSubviews()
        requestLocationAndAuthorizeIfNeeded()
        locationAuthorization()
        locationManager.delegate = self
        mapView.showsUserLocation = true
        setUpConstraints()
        //loadData()
        self.navigationController?.navigationBar.topItem?.title = "Search"
        //self.navigationController?.isNavigationBarHidden = true
        //mapView.delegate = self
        // locationEntry.delegate = self
    }
    
// MARK: - Private Methods
    
    private func addSubviews() {
        view.addSubview(querySearchBar1)
        view.addSubview(locationSearchBar2)
        view.addSubview(mapView)
        view.addSubview(foodCollectionView)
    }
    
    private func locationAuthorization() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        default:
            locationManager.requestWhenInUseAuthorization()
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 15
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: "mapCell", for: indexPath) as? mapCell {
            cell.backgroundColor = #colorLiteral(red: 0.7363304496, green: 1, blue: 0.7854459882, alpha: 1)
            return cell
        }
        return UICollectionViewCell()
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 100, height: 100)
      }
    
// MARK: - Constraint Methods
    
   private func setUpConstraints(){
        querySearchBar1.translatesAutoresizingMaskIntoConstraints = false
        querySearchBar1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        querySearchBar1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        querySearchBar1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        querySearchBar1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075).isActive = true
        
        locationSearchBar2.translatesAutoresizingMaskIntoConstraints = false
        locationSearchBar2.topAnchor.constraint(equalTo: querySearchBar1.bottomAnchor).isActive = true
        locationSearchBar2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        locationSearchBar2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        locationSearchBar2.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075).isActive = true
        
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: locationSearchBar2.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        foodCollectionView.translatesAutoresizingMaskIntoConstraints = false
        //foodCollectionView.topAnchor
        foodCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        foodCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        foodCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        foodCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35).isActive = true
    
    }
   
    
}

extension SearchController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            break
        }
    }
}

extension SearchController: UISearchBarDelegate{
    
}



