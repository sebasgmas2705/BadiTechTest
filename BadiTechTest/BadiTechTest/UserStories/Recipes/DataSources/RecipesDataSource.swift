//
//  RecipesDataSource.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

class RecipesDataSource {
    
//    private(set) var recipes: [Recipes]
    
    var recipesArray: [Recipes]?
    var jsonHeader: JHeader?
    
    
    
//    func requestRecipes(delegate: NetworkDelegate) {
//        delegate.startLoading("no id requested")
//        do {
//            if let file = URL(string: "http://www.recipepuppy.com/api/?i=onions,garlic&p=1") {
//                let data = try Data(contentsOf: file)
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                if  let object = json as? [Any] {
//                    for anItem in object as! [Dictionary<String, AnyObject>] {
//                        let recipeTitle = anItem["title"] as! String
//                        let recipeHref = anItem["href"] as! String
//                        let recipeIngredients = anItem["ingredients"] as! String
//                        let recipeThumbnail = anItem["thumbnail"] as! String
//                        let recipe = Recipes(title: recipeTitle, href: recipeHref, ingredients: recipeIngredients, thumbnail: recipeThumbnail)
//                        recipesArray?.append(recipe)
//                    }
//                    delegate.stopLoadingWithSucces("no id requested")
//                } else {
//                    print("JSON is invalid")
//                    delegate.stopLoadingWithError("no id requested")
//                }
//            } else {
//                print("no file")
//                delegate.stopLoadingWithError("no id requested")
//            }
//        } catch {
//            print(error.localizedDescription)
//            delegate.stopLoadingWithError("no id requested")
//        }
//    }
    
    func requestRecipes(delegate: NetworkDelegate) {

        let urlString = "http://www.recipepuppy.com/api/?i=onions,garlic&p=1"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) {(data, _, error) in
            DispatchQueue.main.async {
                if let err = error {
                    print("ERROR \(error)")
                    return
                }
                guard let data = data else {
                    print("Error: No data to decode")
                    return
                }
                
                guard let header = try? JSONDecoder().decode(JHeader.self, from: data) else {
                    print("Error: Couldn't decode data into Blog")
                    return
                }
                
//                print("blog title: \(self.jsonHeader?.title)")
                
                print(header.results?[1].title)
//                for article in header.results! {
//                    print("- \(article.title)")
//                }
            }

        }.resume()

    }
    
//    func requestRecipes(delegate: NetworkDelegate) {
//        let jsonString = ""
//        if let url = URL(string: "http://www.recipepuppy.com/api/?i=onions,garlic&p=1") {
//            URLSession.shared.dataTask(with: url, completionHandler: {[unowned self](data, response, error) in
////                guard let data = data else { return }
//                print("response")
//
//        })
//        }
//    }
}
