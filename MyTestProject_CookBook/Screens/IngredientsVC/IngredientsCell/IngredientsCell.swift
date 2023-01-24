//
//  IngredientsCell.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 12.01.2023.
//

import UIKit

class IngredientsCell: UITableViewCell {

    @IBOutlet weak var imageCell: ImageView!
    @IBOutlet weak var nameIngredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

extension IngredientsCell {
    func setupUI() {
        selectionStyle = .none
        imageCell.layer.cornerRadius = imageCell.bounds.height / 2
    }
    
    func config(with ingredients: Ingredients) {
        imageCell.fetchImage(from: ingredients.image ?? "person.fill")
        nameIngredientLabel.text = ingredients.text
    }
}
