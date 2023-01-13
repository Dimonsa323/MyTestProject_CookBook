//
//  IngredientsCell.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 12.01.2023.
//

import UIKit

class IngredientsCell: UITableViewCell {

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

private extension IngredientsCell {
    func setupUI() {
        selectionStyle = .none
    }
    
    func config(with: Ingredients) {
        
    }
}
