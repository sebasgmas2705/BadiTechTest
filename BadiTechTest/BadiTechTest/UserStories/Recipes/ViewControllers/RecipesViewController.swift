//
//  RecipesViewController.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import UIKit
import Kingfisher

class RecipesViewController: SharedViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    {
        didSet {
            searchBar.delegate = self
            searchBar.searchBarStyle = .minimal
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "RecipeCollectionViewCell")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    let viewModel = RecipesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func stopLoadingWithSucces(_ idRequest: String) {
        stopActivityIndicator()
        collectionView.reloadData()
    }

}

extension RecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRecipes
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCollectionViewCell", for: indexPath) as? RecipeCollectionViewCell else {
            return  UICollectionViewCell()
            
        }
        
        let recipeAtIndex = viewModel.getRecipe(atIndex: indexPath.row)
        
        cell.recipeName.text = recipeAtIndex?.title
        cell.recipeIngredients.text = recipeAtIndex?.ingredients
        cell.recipeImage.kf.setImage(with: recipeAtIndex?.thumbnail)
        
        return cell
    }
    
}

extension RecipesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let ingredients = searchBar.text else {return}
        let ingredientsArray = ingredients.components(separatedBy: ",")
        if ingredientsArray.count > 1 {
            var ingredientsURL: String = ""
            for (_, ingredient) in ingredientsArray.enumerated() {
                let ingredientTrimmed = ingredient.trimmingCharacters(in: .whitespacesAndNewlines)
                ingredientsURL = ingredientsURL+",\(ingredientTrimmed)"
            }
            ingredientsURL.remove(at: ingredientsURL.startIndex)
            viewModel.requestRecipes(ingredientsUrl: ingredientsURL.lowercased(), delegate: self)
        }else{
            viewModel.requestRecipes(ingredientsUrl: ingredientsArray[0].lowercased(), delegate: self)
        }
        searchBar.resignFirstResponder()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
