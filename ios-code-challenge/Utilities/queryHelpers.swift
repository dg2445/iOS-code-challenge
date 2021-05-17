//
//  queryHelpers.swift
//  ios-code-challenge
//
//  Created by Dave Grzeskowiak on 5/17/21.
//  Copyright © 2021 Dustin Lange. All rights reserved.
//

import Foundation
import CoreLocation

class QueryHelpers : NSObject {
    
    func buildQuery(term: String,
                    sortBy: String,
                    location: CLLocation,
                    limit: Int32,
                    offset: Int32)->YLPSearchQuery
    {
        let query = YLPSearchQuery()
        query.term = term
        query.sortBy = sortBy
        query.latitude = location.coordinate.latitude.description
        query.longitude = location.coordinate.longitude.description
        query.limit = limit
        query.offset = offset
        return query
    }
}

