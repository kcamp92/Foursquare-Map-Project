//
//  DVC Model.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/15/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation
// MARK: - Venue

struct dvcVenue: Codable {
    var id, name: String
    var address: String
    var image2: Data?

}
