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
            replacesMapAnnotationswithSearch()
            foodCollectionView.reloadData()
        }
    }
    
    var venuePics = [UIImage](){
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
    
    //MARK: -@objc Functions
    @objc func listButtonPressed(){}
    
    
    //MARK: -Life-Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.8939689994, green: 1, blue: 0.8997142911, alpha: 1)
        self.view.addSubview(mapView)
        view.addSubview(foodCollectionView)
        addSubviews()
        // mapView.delegate = self
        locationManager.delegate = self
        requestLocationAndAuthorizeIfNeeded()
        locationAuthorization()
        locationManager.delegate = self
        mapView.showsUserLocation = true
        setUpConstraints()
        self.navigationController?.navigationBar.topItem?.title = "Search"
        //self.navigationController?.isNavigationBarHidden = true
        mapView.userTrackingMode = .follow
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "equal.square"), style: .plain, target: self, action: #selector(listButtonPressed))
    }
    
    
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        view.addSubview(querySearchBar1)
        view.addSubview(locationSearchBar2)
        view.addSubview(mapView)
        view.addSubview(foodCollectionView)
        // self.view.addSubview(menuButton)
    }
    
    
    private func replacesMapAnnotationswithSearch(){
        let mapAnnotations = mapView.annotations
        mapView.removeAnnotations(mapAnnotations)
        for i in venueData {
            let newMapAnnotation = MKPointAnnotation()
            newMapAnnotation.coordinate = CLLocationCoordinate2D(latitude: i.location?.lat ?? 40.742054, longitude: i.location?.lng ?? -73.769417)
            newMapAnnotation.title = i.name
            mapView.addAnnotation(newMapAnnotation)
        }
        
    }
    
    private func loadData(query: String, lat:Double, long: Double){
        VenueSearchAPIClient.shared.getVenues(lat:lat, long: long, query: query)
        {(result) in
            switch result {
            case .success(let venue):
                DispatchQueue.main.async {
                    self.venueData = venue
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    // MARK: - CollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: "mapCell", for: indexPath) as? mapCell {
            cell.backgroundColor = #colorLiteral(red: 0.7363304496, green: 1, blue: 0.7854459882, alpha: 1)
            return cell
        }
        return UICollectionViewCell()
    }
    
    /*  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     <#code#>
     }
     */
    
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
// MARK: - Extensions

extension SearchController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("new locations \(locations)")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("an error occurred: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            break
        }
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
    
}
//MARK: - Search Bar Extensions

extension SearchController: UISearchBarDelegate {
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        searchString = searchText
    //    }
    //
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start {(response, error) in
            if response == nil {
                print(error)
            } else {
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                let lattitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                let newAnnotation = MKPointAnnotation()
                newAnnotation.title = searchBar.text
                newAnnotation.coordinate = CLLocationCoordinate2D(latitude: lattitude!, longitude: longitude!)
                self.mapView.addAnnotation(newAnnotation)
                
                let coordinateRegion = MKCoordinateRegion.init(center: newAnnotation.coordinate, latitudinalMeters: self.searchRadius * 2.0, longitudinalMeters: self.searchRadius * 2.0)
                self.mapView.setRegion(coordinateRegion, animated: true)
                
                self.loadData(query: searchBar.text!, lat: newAnnotation.coordinate.latitude, long: newAnnotation.coordinate.longitude)
            }
        }
    }
    
}
