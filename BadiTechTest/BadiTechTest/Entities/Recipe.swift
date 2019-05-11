//
//  Recipes.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    
    let title: String?
    let href: String?
    let ingredients: String?
    let thumbnail: URL?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case href = "href"
        case ingredients = "ingredients"
        case thumbnail = "thumbnail"
    }
    
    init(title: String?, href: String?, ingredients: String?, thumbnail: URL?) {
        self.title = title
        self.href = href
        self.ingredients = ingredients
        self.thumbnail = thumbnail
    }
    
}
