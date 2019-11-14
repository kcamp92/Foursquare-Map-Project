//
//  ListController.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/12/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

private let cellIdentifier = "listCell"

class ListController: UIViewController {
    
    //MARK:- Lazy Variables
    
    lazy var listTableView: UITableView = {
    let tv: UITableView = UITableView()
        tv.backgroundColor = .clear
    tv.register(listCell.self, forCellReuseIdentifier: cellIdentifier)
    tv.delegate = self
    tv.dataSource = self
    return tv
    }()
        
    
 //MARK:- Data Passing Variables
    
     var venueData = [Venue](){
         didSet{
             
           listTableView.reloadData()
         }
     }
     
     var venuePics = [UIImage](){
         didSet{
            
             listTableView.reloadData()
         }
     }
     
 //MARK:- Lifecycycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "List Results"
        setupConstraints()
        Colors.shared.setGradientBackground(colorTop: .gray, colorBottom: .white, newView: view)
    }
    
//MARK:- Private Methods
    
    private func setupConstraints(){
    self.view.addSubview(listTableView)
    listTableView.translatesAutoresizingMaskIntoConstraints = false
    listTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    listTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    listTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    listTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }
    }

 //MARK:- Tableview Methods Extension

extension ListController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venueData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let venueInfo = venueData[indexPath.row]
        let venuePicInfo = venuePics[indexPath.row]
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! listCell
        cell.backgroundColor = .clear
        cell.foodCatImage.image = venuePicInfo
        cell.venueLabel.text = venueInfo.name
        cell.catLabel.text = venueInfo.location?.address
            return cell
        
        //return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //add code for detail view controller
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

