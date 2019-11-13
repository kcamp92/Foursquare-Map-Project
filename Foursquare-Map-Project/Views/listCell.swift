//
//  listCell.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/12/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class listCell: UITableViewCell {

    lazy var foodCatImage: UIImageView = {
    let iv = UIImageView()
    iv.clipsToBounds = true
    iv.contentMode = .scaleToFill
    iv.backgroundColor = .systemIndigo
     return iv
    }()
    
    lazy var venueLabel:UILabel = {
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
    
    lazy var catLabel:UILabel = {
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
    
 // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        
    }
   
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    
    //MARK: - Private Methods
    
    private func addSubviews() {
       contentView.addSubview(foodCatImage)
       contentView.addSubview(venueLabel)
       contentView.addSubview(catLabel)
           
       }
    
    private func setupConstraints() {
       
        foodCatImage.translatesAutoresizingMaskIntoConstraints = false
        foodCatImage.topAnchor.constraint(equalTo: self.topAnchor, constant:  5).isActive = true
        foodCatImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:  5).isActive = true
        foodCatImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        foodCatImage.widthAnchor.constraint(equalTo: self.foodCatImage.heightAnchor).isActive = true
        
        venueLabel.translatesAutoresizingMaskIntoConstraints = false
        venueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        venueLabel.leadingAnchor.constraint(equalTo: self.foodCatImage.trailingAnchor, constant: 10).isActive = true
        venueLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        venueLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        catLabel.topAnchor.constraint(equalTo: venueLabel.bottomAnchor, constant: 10).isActive = true
        catLabel.leadingAnchor.constraint(equalTo: self.foodCatImage.trailingAnchor, constant: 10).isActive = true
        catLabel.heightAnchor.constraint(equalTo: self.venueLabel.heightAnchor).isActive = true
        catLabel.widthAnchor.constraint(equalTo: self.venueLabel.widthAnchor).isActive = true
        
        
        
        
        
        
        
        
    }
   
}

