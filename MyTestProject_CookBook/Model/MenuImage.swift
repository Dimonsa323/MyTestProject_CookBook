//
//  MenuImage.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 10.01.2023.
//

import Foundation
import UIKit

enum MenuImage: String, CaseIterable {
    case meat
    case chicken
    case fish
    case greens
    
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
        }
    }
}
