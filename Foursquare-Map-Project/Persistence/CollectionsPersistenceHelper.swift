//
//  CollectionsPersistenceHelper.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/7/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct VenuePersistenceManager{
    private init (){}
    static let manager = VenuePersistenceManager()
    private let persistenceHelper = PersistenceHelper<Bookmark>(fileName: "venueBookmark.plist")
    
    func saveVenueArr(venue: [Bookmark]) throws {
        try persistenceHelper.save(newElements: venue)
    }
    
    func getBookmarks() throws -> [Bookmark]{
        return try persistenceHelper.getObjects()
    }
    
//    func deleteCard(cardTitle: String) {
//        do {
//        let deleteCard = try getCard().filter({$0.cardTitle != cardTitle})
//        try  persistenceHelper.replace(elements: deleteCard)
//        }catch{
//         print(error)
//        }
//    }
}

