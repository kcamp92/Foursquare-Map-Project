//
//  foodCell.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/6/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class mapCell: UICollectionViewCell {
    
// MARK: - UI Properties
    
    lazy var foodImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .systemIndigo
        return iv
    }()
    
    // MARK: - Initializers
      override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(foodImage)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
      // MARK: - Contraints
    
    private func setupConstraints(){
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        foodImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        foodImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        foodImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        }
        
        
    }


