//
//  RecipeCollectionViewCell.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
