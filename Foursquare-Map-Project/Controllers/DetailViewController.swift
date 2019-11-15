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
          label.font = UIFont(name: "Marker Felt", size: 18.0)
          label.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
          label.textAlignment = .center
          label.adjustsFontSizeToFitWidth = true
          label.layer.cornerRadius = 20
        //  label.isHidden = true
          label.backgroundColor = .systemPink
      return label
      }()
      
      lazy var addressLabel:UILabel = {
      let label = UILabel()
          label.textAlignment = .center
          label.font = UIFont(name: "Marker Felt", size: 18.0)
          label.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
          label.textAlignment = .center
          label.adjustsFontSizeToFitWidth = true
          label.layer.cornerRadius = 20
          //label.isHidden = true
          label.backgroundColor = .systemPink
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
    }
    
    func setLabels(){
        venueNameLabel.text = detailInfo.name
        addressLabel.text = detailInfo.address
      //  foodImage.image = detailInfo.image
    }
    
    @objc func addButtonPressed(){
        let createVC = CreateNewCollectionVC()
//          listVC.venueData = self.venueData
//          listVC.venuePics = self.venuePics
        navigationController?.pushViewController(createVC, animated: true)
      }
    
    private func addSubviews() {
        self.view.addSubview(venueNameLabel)
        self.view.addSubview(addressLabel)
        self.view.addSubview(foodImage)
              
          }
       
       private func setupConstraints() {
          
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        venueNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant:  5).isActive = true
        venueNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  5).isActive = true
        venueNameLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
        venueNameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
           
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant:  5).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  5).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant:  5).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:  5).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
           
           
       }
      
}
