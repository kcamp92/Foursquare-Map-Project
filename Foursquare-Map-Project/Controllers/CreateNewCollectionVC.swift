//
//  CreateNewCollectionVC.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/15/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

private let cellIdentifier = "createCell"

class CreateNewCollectionVC: UIViewController, UITextFieldDelegate {
       
//    MARK: - Instances
    
      var createBookmark = [Bookmark]()
    
      var venuesSelected: Venue?
       
//  MARK: - Properties

lazy var titleTextField: UITextField = {
       let tf = UITextField()
       tf.textAlignment = .center
       tf.font = UIFont(name: "Marker Felt", size: 18.0)
       tf.textColor = .black
       tf.delegate = self
       tf.textAlignment = .center
       tf.placeholder = "Please enter category title"
       tf.layer.cornerRadius = 20
       tf.backgroundColor = .white
       return tf
               }()
    
    
lazy var createCollectionView: UICollectionView = {
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 175, height: 175)
        layout.scrollDirection = .horizontal
        cv.backgroundColor = .clear
        cv.register(createCell.self, forCellWithReuseIdentifier: cellIdentifier)
       // cv.delegate = self
       // cv.dataSource = self
        return cv
            }()
    
    lazy var createButton: UIButton = {
        let button = UIButton()
        // button.setImage(UIImage(named:"more-filled", for: )
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .clear
        button.alpha = 1
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        return button
            }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        // button.setImage(UIImage(named:"more-filled", for: )
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .clear
        button.alpha = 1
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        return button
            }()
    
// MARK: - @objc Functions
    
    @objc func createButtonPressed(){
        print("button pressed")
//           guard titleTextField.text != "" && titleTextField.text != nil,
//           fact1TextView.text  != "" && fact1TextView.text != nil,
//               fact2TextView.text != "" && fact2TextView.text != nil else {
//                   saveAlert(message: "invalidEntry")
                   return
           }
    @objc func deleteButtonPressed(){
        print("delete button pressed")
//            guard titleTextField.text != "" && titleTextField.text != nil,
//            fact1TextView.text  != "" && fact1TextView.text != nil,
//                fact2TextView.text != "" && fact2TextView.text != nil else {
//                    saveAlert(message: "invalidEntry")
                       return
               }
// MARK: - Private Methods
    
//MARK: -Life-Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Constraint Methods
}

    // MARK: - Extensions

//extension CreateNewCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
