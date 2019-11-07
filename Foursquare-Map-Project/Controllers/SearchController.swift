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

private let cellIdentifier = "foodCell"

class SearchController: UIViewController {
    
    private let locationManager = CLLocationManager()
   // let mapView = MKMapView(frame: UIScreen.main.bounds)
    
    lazy var searchBar1: UISearchBar = {
    let sb =  UISearchBar()
        return sb
    }()
    
    
    lazy var searchBar2: UISearchBar = {
        let sb =  UISearchBar()
            return sb
    }()
    lazy var mapView: MKMapView = {
        let mv = MKMapView()
        return mv
    }()
    
    lazy var foodCollectionView: UICollectionView = {
    var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
    layout.itemSize = CGSize(width: 175, height: 175)
    layout.scrollDirection = .horizontal
    cv.backgroundColor = .systemPink
    cv.register(foodCell.self, forCellWithReuseIdentifier: cellIdentifier)
    
        
    return cv 
    }()
    
    
    private func requestLocationAndAuthorizeIfNeeded() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }

    
//    lazy var cardCollectionView: UICollectionView = {
//           var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
//           let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
//           layout.itemSize = CGSize(width: 350, height: 350)
//           layout.scrollDirection = .vertical
//           cv.backgroundColor = #colorLiteral(red: 1, green: 0.9052013159, blue: 1, alpha: 1)
//          // layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
//           cv.register(CardCell.self, forCellWithReuseIdentifier: cellIdentifier)
//           cv.layer.borderColor = UIColor.black.cgColor
//           cv.layer.borderWidth = 2
//           cv.layer.cornerRadius = 20
//           cv.dataSource = self
//           cv.delegate = self
//           return cv
//       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8939689994, green: 1, blue: 0.8997142911, alpha: 1)
        self.view.addSubview(mapView)
        view.addSubview(foodCollectionView)
       // requestLocationAndAuthorizeIfNeeded()
        //locationManager.delegate = self
        //mapView.showsUserLocation = true
        //setUpConstraints()
        //loadData()

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
