//
//  DetailViewController.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/14/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import MapKit

class DetailViewController: UIViewController {
    
    var detailInfo: dvcVenue!

    lazy var venueNameLabel:UILabel = {
      let label = UILabel()
          label.textAlignment = .center
          label.font = UIFont(name: "Marker Felt", size: 25.0)
        label.textColor = .black
          label.textAlignment = .center
          label.adjustsFontSizeToFitWidth = true
          label.layer.cornerRadius = 20
        //  label.isHidden = true
         // label.backgroundColor = .systemPink
      return label
      }()
      
      lazy var addressLabel:UILabel = {
      let label = UILabel()
          label.textAlignment = .center
          label.font = UIFont(name: "Marker Felt", size: 25.0)
        label.textColor = .black
          label.textAlignment = .center
          label.adjustsFontSizeToFitWidth = true
          label.layer.cornerRadius = 20
          //label.isHidden = true
         // label.backgroundColor = .systemOrange
      return label
      }()
    
    lazy var foodImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .systemIndigo
        return iv
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addButtonPressed))
        addSubviews()
        setupConstraints()
        setLabels()
        Colors.shared.setGradientBackground(colorTop: .gray, colorBottom: .white, newView: view)
    }
    
    func setLabels(){
        venueNameLabel.text = detailInfo.name
        addressLabel.text = detailInfo.address
        //foodImage.image = detailInfo.image2
        foodImage.image = UIImage(named: "placeholder")
    }
    
    @objc func addButtonPressed(){
        let createVC = CreateNewCollectionVC()
        navigationController?.pushViewController(createVC, animated: true)
      }
    

    
    private func addSubviews() {
        self.view.addSubview(venueNameLabel)
        self.view.addSubview(addressLabel)
        self.view.addSubview(foodImage)
              
          }
   
       private func setupConstraints() {
          
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        venueNameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        venueNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        venueNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        venueNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
           
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor, constant:  10).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  10).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        foodImage.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 80).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
           
           
       }
      
}
