//
//  Bookmark.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/15/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct Bookmark: Codable {
    
    var image: Data?
    var categoryName: String
    var venues: [Venue]?
}
