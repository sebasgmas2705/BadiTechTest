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
    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var hasLactoseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUIImage()
        rotateLabel()
        addShadowUIImageView()
        rouncCornersUIImageView()
    }
    
    func setUpUIImage() {
        recipeImage.clipsToBounds = true
        recipeImage.contentMode = .scaleAspectFill
    }
    
    func addShadowUIImageView() {
        shadowImage.layer.shadowColor = UIColor.black.cgColor
        shadowImage.layer.shadowOffset = CGSize(width: 1, height: 1)
        shadowImage.layer.shadowOpacity = 1
        shadowImage.layer.shadowRadius = 3.0
        shadowImage.layer.masksToBounds = false
    }
    
    func rouncCornersUIImageView() {
        recipeImage.layer.cornerRadius = 8.0
    }
    
    func rotateLabel() {
        hasLactoseLabel.transform = CGAffineTransform(rotationAngle: .pi / 4)
    }

}
