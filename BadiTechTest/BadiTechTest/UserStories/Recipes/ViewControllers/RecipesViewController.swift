//
//  RecipesViewController.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import UIKit

class RecipesViewController: SharedViewController {
    
    let viewModel = RecipesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.requestRecipes(delegate: self)
        print(viewModel.numberOfRecipes)
    }

}
