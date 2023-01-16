//
//  MenuImage.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 10.01.2023.
//

import Foundation
import UIKit

enum MenuModel: String, CaseIterable {
    case meat
    case chicken
    case fish
    case greens
    case favorite
    
    var title: String {
        switch self {
        case .meat:
            return "Meat"
        case .chicken:
            return "Chicken"
        case .fish:
            return "Fish"
        case .greens:
            return "Greens"
        case .favorite:
            return "Favorite"
        }
    }
    
    var partURL: String {
        switch self {
        case .meat:
            return "meat"
        case .fish:
            return "fish"
        case .chicken:
            return "chicken"
        case .greens:
            return "greens"
        case .favorite:
            return "Favorite"
        }
    }
    
    var navTitle: String {
        switch self {
        case .meat:
            return "Meat recipies"
        case .fish:
            return "Fish recipies"
        case .chicken:
            return "Chicken recipies"
        case .greens:
            return "Greens recipies"
        case .favorite:
            return "Favorite"
        }
    }
    
    var sectionImage: String {
        rawValue
    }
}
