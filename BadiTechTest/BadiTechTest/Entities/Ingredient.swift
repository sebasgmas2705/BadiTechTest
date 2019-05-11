//
//  Ingredient.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

struct Ingredient {
    
    let ingredientName: String?
    let hasLactose: Bool?
    
    init(ingredientName: String?, hasLactose: Bool?) {
        self.ingredientName = ingredientName
        self.hasLactose = hasLactose
    }
    
}
