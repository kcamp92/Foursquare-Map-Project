//
//  CollectionsPersistenceHelper.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/7/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

/*struct CardPersistenceManager{
    private init (){}
    static let manager = CardPersistenceManager()
    private let persistenceHelper = PersistenceHelper<Card>(fileName: "flashCard.plist")
    
    func saveCard(flashCard: Card) throws {
        try persistenceHelper.save(newElement: flashCard)
    }
    func getCard() throws -> [Card]{
        return try persistenceHelper.getObjects()
    }
    
    func deleteCard(cardTitle: String) {
        do {
        let deleteCard = try getCard().filter({$0.cardTitle != cardTitle})
        try  persistenceHelper.replace(elements: deleteCard)
        }catch{
         print(error)
        }
    }
}
*/
