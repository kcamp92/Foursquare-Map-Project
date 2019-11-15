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
    let code: Int?
    let requestId: String?

}

// MARK: - Response
struct ResponseImages: Codable {
    let photos: Photos
}

// MARK: - Photos
struct Photos: Codable {
    let count: Int?
    let items: [Item]
    let dupesRemoved: Int?
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let createdAt: Int?
    let prefix: String
    let suffix: String
    let width, height: Int?
   

    func getImageURL() -> String{
        return
    prefix + "Original" + suffix
        
    }
}

//// MARK: - Photo
//struct Photo: Codable {
//    let photoPrefix: String
//    let suffix: String
//
//    enum CodingKeys: String, CodingKey {
//        case photoPrefix = "prefix"
//        case suffix
//    }
//}

/*

//let url = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(Secrets.client_id)&client_secret=\(Secrets.client_secret)&v=20191104&limit=1"


//let url = "https://api.foursquare.com/v2/venues/5bca0ff80ff4f9002cd191b4/photos?client_id=BJUTN2W113ZDJULWRQDBIGSV3VLIXSSHFSYT3K5PSNDDK1CM&client_secret=RMLKHOFTTFXDUNYYRMTSU0WMQGKGP1Y4KZNHWHWM2I0222IF&v=20191104&limit=1"



//url = "prefix": "https://fastly.4sqi.net/img/general/",
//    "suffix": "/2488950_kGzVOZndNiAQwWUanmusJfR4jNapmcDwtmf2ufKp8lk.jpg"
*/
