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
    @IBOutlet weak var hasLactoseLabel: UILabel!
    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var buttonFavorite: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUIImage()
        rotateLabel()
        addShadow()
        roundCorners()
    }
    
    //MARK: - Actions
    
    @IBAction func favoriteTapped(_ sender: Any) {}
    
    
    func setUpUIImage() {
        recipeImage.clipsToBounds = true
        recipeImage.contentMode = .scaleAspectFill
    }
    
    func addShadow() {
        shadowImage.layer.shadowColor = UIColor.lightGray.cgColor
        shadowImage.layer.shadowOffset = CGSize(width:1.0 ,height: 1.0)
        shadowImage.layer.shadowRadius = 4.0
        shadowImage.layer.shadowOpacity = 0.8
        shadowImage.layer.masksToBounds = false
        
        buttonFavorite.layer.shadowColor = UIColor.lightGray.cgColor
        buttonFavorite.layer.shadowOffset = CGSize(width:1.0 ,height: 1.0)
        buttonFavorite.layer.shadowRadius = 4.0
        buttonFavorite.layer.shadowOpacity = 0.5
    }
    
    func roundCorners() {
        recipeImage.layer.cornerRadius = 8.0
        shadowImage.layer.cornerRadius = 8.0
        buttonFavorite.layer.cornerRadius = 8.0
    }
    
    func rotateLabel() {
        hasLactoseLabel.transform = CGAffineTransform(rotationAngle: .pi / 4)
        hasLactoseLabel.isHidden = true
    }

}
