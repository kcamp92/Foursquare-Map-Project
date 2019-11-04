//
//  VenueSearchAPIClient.swift
//  Foursquare-Map-Project
//
//  Created by Krystal Campbell on 11/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation
/*
import Foundation

class WeatherAPIClient {
    
    private init() {}
    static let shared = WeatherAPIClient()
    
    func getWeather(latLong: String,completionHandler: @escaping (Result<[WeatherData], AppError>)-> Void){
        
        let URLString = "https://api.darksky.net/forecast/\(Secrets.key)/\(latLong)"
        guard let url = URL(string: URLString) else {completionHandler(.failure(AppError.badURL))
            return
        }
    NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (results)in
        switch results {
        case .failure(let error):
            completionHandler(.failure(error))
        case .success(let data):
            do {
        let weatherDecoded = try JSONDecoder().decode(Weather.self, from: data)
                completionHandler(.success(weatherDecoded.daily.data))
            } catch {
        completionHandler(.failure(AppError.couldNotParseJSON(rawError:error)))
                        }
                    }
                }
            }
        }
*/

//"https://api.foursquare.com/v2/venues/search?client_id=\(Secrets.id)&client_secret=\(Secrets.key)&ll=\(latLong)&query=\(query)&v=20191104"


