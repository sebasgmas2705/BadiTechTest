//
//  RecipesViewController.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import UIKit
import Kingfisher
import SafariServices

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
    var searched: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        boardingMessage()
    }
    
    override func stopLoadingWithSucces(_ idRequest: String) {
        stopActivityIndicator()
        collectionView.reloadData()
    }
    
    func safariServices(_ href: String) {
        if let url = URL(string: href) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }

}

extension RecipesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.size.width * 0.8,height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let hrefAtIndex = viewModel.getHrefFromRecipe(atIndex: indexPath.row) else {
            return
        }
        safariServices(hrefAtIndex)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.numberOfRecipes == 0 && searched ?? false {
            noRecipesFoundAlert()
        }
        return viewModel.numberOfRecipes
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCollectionViewCell", for: indexPath) as? RecipeCollectionViewCell else {
            return  UICollectionViewCell()
            
        }
        
        let recipeAtIndex = viewModel.getRecipe(atIndex: indexPath.row)
        cell.hasLactoseLabel.isHidden = true
        checkIfContainsLactose(recipeAtIndex, cell)
        cell.recipeName.text = recipeAtIndex?.title
        cell.recipeIngredients.text = recipeAtIndex?.ingredients
        cell.recipeImage.kf.setImage(with: recipeAtIndex?.thumbnail)
        
        return cell
    }
    
    fileprivate func checkIfContainsLactose(_ recipeAtIndex: Recipe?, _ cell: RecipeCollectionViewCell) {
        let ingredientsInArray = recipeAtIndex?.ingredients?.components(separatedBy: ",")
        for ingredient in ingredientsInArray ?? [""] {
            if ingredient == Constants.WHITESPACE_CHEESE || ingredient == Constants.CHEESE || ingredient == Constants.WHITESPACE_MILK || ingredient == Constants.MILK {
                cell.hasLactoseLabel.isHidden = false
            }
        }
    }
    
}

extension RecipesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searched = true
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
            let ingredient = ingredientsArray[0]
            if ingredient.hasPrefix(" ") ||  ingredient.hasSuffix(" "){
                viewModel.requestRecipes(ingredientsUrl: ingredientsArray[0].lowercased().trimmingCharacters(in: .whitespacesAndNewlines), delegate: self)
            }else{
                viewModel.requestRecipes(ingredientsUrl: ingredientsArray[0].lowercased(), delegate: self)
            }
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
