//
//  ios-code-challengeTests-Swift.swift
//  ios-code-challengeTests
//
//  Created by Dave Grzeskowiak on 5/17/21.
//  Copyright © 2021 Dustin Lange. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ios_code_challenge


class ios_code_challengeTests_Swift: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testBuildQuery() throws {
        // Given
        let queryHelper = QueryHelpers()
        let location = CLLocation.init(latitude: 41.619549, longitude: -93.598022)
        
        // When
        let query = queryHelper.buildQuery(term: "tacos", sortBy: "distance", location: location, limit: 20, offset: 0)
        
        //Then
        XCTAssertEqual(query.term, "tacos")
        XCTAssertEqual(query.latitude, "41.619549")
        XCTAssertEqual(query.longitude, "-93.598022")
        XCTAssertEqual(query.limit, Int32(20))
        XCTAssertEqual(query.offset, Int32(0))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
