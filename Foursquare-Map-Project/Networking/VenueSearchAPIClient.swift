//
//  VenueSearchAPIClient.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

class VenueSearchAPIClient {
    
    private init() {}
    static let shared = VenueSearchAPIClient()
    
    func getVenues(latLong: String, query: String, completionHandler: @escaping (Result<[Venue], AppError>)-> Void){
        
        let URLString = "https://api.foursquare.com/v2/venues/search?client_id=\(Secrets.id)&client_secret=\(Secrets.key)&ll=\(latLong)&query=\(query)&v=20191104"
        guard let url = URL(string: URLString) else {completionHandler(.failure(AppError.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get){(results)in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let venuesDecoded = try JSONDecoder().decode(Venues.self, from: data)
                    completionHandler(.success((venuesDecoded.response?.venues)!))
                } catch {
                    completionHandler(.failure(AppError.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}

//"https://api.foursquare.com/v2/venues/search?client_id=\(Secrets.id)&client_secret=\(Secrets.key)&ll=\(latLong)&query=\(query)&v=20191104"


//https://api.foursquare.com/v2/venues/search?client_id=BJUTN2W113ZDJULWRQDBIGSV3VLIXSSHFSYT3K5PSNDDK1CM&client_secret=RMLKHOFTTFXDUNYYRMTSU0WMQGKGP1Y4KZNHWHWM2I0222IF&ll=40.7,-74&query=sushi&v=20191104
