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
