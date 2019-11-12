//
//  CollectionsController.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

private let cellIdentifier = "collectionCell"

class CollectionsController: UIViewController {
    
 // MARK: - UI Properties
    
    lazy var collectionsCV: UICollectionView = {
     var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
     let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
     //let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
     layout.itemSize = CGSize(width: 175, height: 175)
     layout.scrollDirection = .horizontal
     cv.backgroundColor = .systemGreen
     cv.register(mapCell.self, forCellWithReuseIdentifier: cellIdentifier)
     //cv.layer.borderColor = UIColor.black.cgColor
    // cv.layer.borderWidth = 2
     //cv.layer.cornerRadius = 20
     //cv.delegate = self
     //cv.dataSource = self
     return cv
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

}
//extension CollectionsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//}
//
//
//}
