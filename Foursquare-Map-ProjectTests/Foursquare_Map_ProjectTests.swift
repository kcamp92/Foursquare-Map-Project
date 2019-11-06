//
//  Foursquare_Map_ProjectTests.swift
//  Foursquare-Map-ProjectTests
//
//  Created by Krystal Campbell on 11/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import XCTest
@testable import Foursquare_Map_Project

class Foursquare_Map_ProjectTests: XCTestCase {

    private func getVenueData() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Venue", ofType: "json")
            else {
                fatalError("Venue.json file not found")
        }
          let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("could not find file: \(jsonError)")
        }
    }
    
    func testVenueDataLoad(){
        let venue = Venue.getVenueData()
        XCTAssert((venue.response?.venues!.count)! > 0, "donde esta data?" )
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
