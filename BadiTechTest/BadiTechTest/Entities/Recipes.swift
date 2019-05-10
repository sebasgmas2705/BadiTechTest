//
//  Recipes.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

struct Recipes: Codable {
    
    let title: String?
    let href: URL?
    let ingredients: String?
    let thumbnail: URL?
    
//    enum CodingKeys: String, CodingKey {
//        case title = "title"
//        case href = "href"
//        case ingredients = "ingredients"
//        case thumbnail = "thumbnail"
//    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.href = try container.decode(String.self, forKey: .href)
//        self.ingredients = try container.decode(String.self, forKey: .ingredients)
//        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
//    }
//    
    
//    init(title: String?, href: String?, ingredients: String?, thumbnail: String?) {
//        self.title = title
//        self.href = href
//        self.ingredients = ingredients
//        self.thumbnail = thumbnail
//    }
    
}
