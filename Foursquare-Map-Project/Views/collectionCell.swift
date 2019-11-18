//
//  collectionCell.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/12/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class collectionCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    lazy var foodImage: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    lazy var collectionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
}
/*  lazy var foodCatImage: UIImageView = {
  let iv = UIImageView()
  iv.clipsToBounds = true
  iv.contentMode = .scaleToFill
  iv.backgroundColor = .systemIndigo
   return iv
  }()
  
  lazy var venueLabel:UILabel = {
  let label = UILabel()
      label.textAlignment = .center
      label.font = UIFont(name: "Marker Felt", size: 20.0)
      label.textColor = .black
      label.textAlignment = .center
      label.adjustsFontSizeToFitWidth = true
      label.layer.cornerRadius = 20
    //  label.isHidden = true
      label.backgroundColor = .clear
  return label
  }()*/
