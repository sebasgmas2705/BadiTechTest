//
//  JHeader.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

struct JHeader: Codable{
//    let title: String?
//    let version: String?
//    let href: String?
    let results: [Recipes]?
    
//    enum CodingKeys: String, CodingKey {
//        case title = "title"
//        case version = "version"
//        case href = "href"
//        case results = "results"
//    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        //        let response = try container.nestedContainer(keyedBy:
//        //            CodingKeys.self, forKey: .response)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.version = try container.decode(String.self, forKey: .version)
//        self.href = try container.decode(String.self, forKey: .href)
//        self.results = try container.decode([Recipes].self, forKey: .results)
//    }
    
    //    init(title: String?, version: String?, href: String?, thumbnail: String?) {
    //        self.title = title
    //        self.version = version
    //        self.href = href
    //    }
    
}

