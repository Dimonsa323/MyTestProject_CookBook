//
//  MenuCell.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 10.01.2023.
//

import UIKit

class MenuCell: UICollectionViewCell {

    @IBOutlet weak var menuImage: ImageView!
    @IBOutlet weak var menuText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    func config(type: MenuModel) {
        menuText.text = type.title
        menuImage.image = UIImage(named: type.sectionImage)
    }
}

private extension MenuCell {
    
    func setupUI() {
        menuImage.layer.cornerRadius = 8
    }
}

