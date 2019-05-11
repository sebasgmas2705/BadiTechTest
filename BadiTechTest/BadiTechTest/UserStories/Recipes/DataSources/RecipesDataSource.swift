//
//  RecipesDataSource.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

class RecipesDataSource {
    
    private(set) var recipesArray: [Recipe]?
    private(set) var jsonHeader: JHeader?
    var ingredientsURLComposed: String?
    
    func requestRecipes(delegate: NetworkDelegate, ingredientsUrl: String) {
        
        delegate.startLoading(Constants.NOT_NEEDED_ID)

        let urlString = Constants.API_BASE_URL+ingredientsUrl+Constants.PAGINATION
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) {(data, _, error) in
            DispatchQueue.main.async {
                if let err = error {
                    print("ERROR \(error)")
                    delegate.stopLoadingWithError(Constants.NOT_NEEDED_ID)
                    return
                }
                guard let data = data else {
                    print("Error: No data to decode")
                    delegate.stopLoadingWithError(Constants.NOT_NEEDED_ID)
                    return
                }
                
                guard let header = try? JSONDecoder().decode(JHeader.self, from: data) else {
                    print("Error: Couldn't decode data into JHeader")
                    delegate.stopLoadingWithError(Constants.NOT_NEEDED_ID)
                    return
                }
                self.recipesArray = header.results
                delegate.stopLoadingWithSucces(Constants.NOT_NEEDED_ID)
            }
        }.resume()
    }
    
}
