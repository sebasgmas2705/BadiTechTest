//
//  JHeader.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

struct JHeader: Codable{
    let results: [Recipe]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(results: [Recipe]?) {
        self.results = results
    }
    
}

