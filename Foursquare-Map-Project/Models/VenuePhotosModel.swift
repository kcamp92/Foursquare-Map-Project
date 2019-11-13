//
//  VenuePhotosModel.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

// MARK: - Welcome

struct VenueImages: Codable {
    let meta: MetaImages
    let response: ResponseImages
}

// MARK: - Meta
struct MetaImages: Codable {
    let code: Int
    let requestID: String

    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}

// MARK: - Response
struct ResponseImages: Codable {
    let photos: Photos
}

// MARK: - Photos
struct Photos: Codable {
    let count: Int
    let items: [Item]
    let dupesRemoved: Int
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let createdAt: Int
    let source: Source
    let itemPrefix: String
    let suffix: String
    let width, height: Int
    let user: User
    let checkin: Checkin
    let visibility: String

    enum CodingKeys: String, CodingKey {
        case id, createdAt, source
        case itemPrefix = "prefix"
        case suffix, width, height, user, checkin, visibility
    }
    
    func getImageURL() -> String{
        return
    itemPrefix + "Original" + suffix
        
    }
}

// MARK: - Checkin
struct Checkin: Codable {
    let id: String
    let createdAt: Int
    let type: String
    let timeZoneOffset: Int
}

// MARK: - Source
struct Source: Codable {
    let name: String
    let url: String
}

// MARK: - User
struct User: Codable {
    let id, firstName, lastName, gender: String
    let photo: Photo
}

// MARK: - Photo
struct Photo: Codable {
    let photoPrefix: String
    let suffix: String

    enum CodingKeys: String, CodingKey {
        case photoPrefix = "prefix"
        case suffix
    }
}

/*

//let url = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(Secrets.client_id)&client_secret=\(Secrets.client_secret)&v=20191104&limit=1"


//let url = "https://api.foursquare.com/v2/venues/5bca0ff80ff4f9002cd191b4/photos?client_id=BJUTN2W113ZDJULWRQDBIGSV3VLIXSSHFSYT3K5PSNDDK1CM&client_secret=RMLKHOFTTFXDUNYYRMTSU0WMQGKGP1Y4KZNHWHWM2I0222IF&v=20191104&limit=1"



//url = "prefix": "https://fastly.4sqi.net/img/general/",
//    "suffix": "/2488950_kGzVOZndNiAQwWUanmusJfR4jNapmcDwtmf2ufKp8lk.jpg"
*/
