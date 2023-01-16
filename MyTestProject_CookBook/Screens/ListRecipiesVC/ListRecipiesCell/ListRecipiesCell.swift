//
//  ListRecipiesCell.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 12.01.2023.
//

import UIKit

class ListRecipiesCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: ImageView!
    @IBOutlet weak var nameRecipeLabel: UILabel!
    @IBOutlet weak var textRecipeLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

extension ListRecipiesCell {
    
    func setupUI() {
        selectionStyle = .none
        imageViewCell.layer.cornerRadius = imageViewCell.bounds.height / 2
    }
    
    func config(with recipe: Recipe) {
        imageViewCell.fetchImage(from: recipe.image)
        nameRecipeLabel.text = recipe.label
        textRecipeLabel.text = recipe.source
        authorNameLabel.text = "Author: \(recipe.source)"

    }
}
