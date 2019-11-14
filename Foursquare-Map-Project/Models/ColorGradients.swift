//
//  ColorGradients.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/13/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static let shared = Colors()
    
func setGradientBackground(colorTop: UIColor, colorBottom: UIColor,newView:UIView) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.locations = [0, 1]
    gradientLayer.frame = newView.bounds
    newView.layer.insertSublayer(gradientLayer, at: 0)
}
}
