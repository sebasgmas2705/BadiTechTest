//
//  RecipesViewModel.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

class RecipesViewModel {
    
    private let dataSource = RecipesDataSource()
    
    var numberOfRecipes: Int {
        return dataSource.recipesArray?.count ?? 0
    }
    
    func getRecipe(atIndex index: Int) -> Recipe? {
        return dataSource.recipesArray?[index]
    }
    
    func requestRecipes(ingredientsUrl: String, delegate: NetworkDelegate){
        dataSource.requestRecipes(delegate: delegate, ingredientsUrl: ingredientsUrl)
    }

}
