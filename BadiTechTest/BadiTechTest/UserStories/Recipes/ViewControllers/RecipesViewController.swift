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
        
    @IBOutlet weak var searchButton: UIButton!

    @IBOutlet weak var searchBar: UISearchBar!
    {
        didSet {
            searchBar.delegate = self
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            //RecipeCollectionViewCell
            collectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "RecipeCollectionViewCell")
            
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    
    let viewModel = RecipesViewModel()
    
    //CHECK: - should this be created in this class
    var ingredientsToRequest: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.requestRecipes(delegate: self)
    }
    
    override func stopLoadingWithSucces(_ idRequest: String) {
        print("acabe de cargar")
        collectionView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func searchTapped(_ sender: Any) {
        var ingrArray: [String]?
        guard let ingredients = searchBar.text else {return}
        let ingredientsArray = ingredients.components(separatedBy: ",")
        for ingredient in ingredientsArray {
            let ingr = ingredient.trimmingCharacters(in: .whitespacesAndNewlines)
            ingrArray?.append(ingr)
        }
        
        if ingredientsArray.count > 1 {
            
        }else{
            viewModel.requestRecipes(ingredientsUrl: ingredientsArray[0], delegate: self)
        }
        for ingredient in ingredientsArray {
            
        }
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

extension RecipesViewController: UISearchBarDelegate {}
