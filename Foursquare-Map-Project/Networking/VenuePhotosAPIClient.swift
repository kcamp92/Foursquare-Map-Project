//
//  VenuePhotosAPIClient.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

class VenuePhotoAPIClient {

    private init() {}
    static let shared = VenuePhotoAPIClient()

    func getVenues(latLong: String, venueId: String, completionHandler: @escaping (Result<[Venue], AppError>)-> Void){

        let URLString = "https://api.foursquare.com/v2/venues/\(venueId)/photos?client_id=\(Secrets.id)&client_secret=\(Secrets.key)&v=20191104&limit=1"
        

        
        guard let url = URL(string: URLString) else {
            
            completionHandler(.failure(AppError.badURL))
            return
        }
            
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get){(results)in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let venuesDecoded = try JSONDecoder().decode(Venues.self, from: data)
                    if let venue = venuesDecoded.response?.venues {
                    completionHandler(.success(venue))
                    }
                }catch{
                    completionHandler(.failure(AppError.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}


//https://api.foursquare.com/v2/venues/VENUE_ID/photos


//https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD
