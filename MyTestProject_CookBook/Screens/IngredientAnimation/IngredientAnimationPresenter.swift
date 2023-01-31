//
//  IngredientAnimationPresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 16.01.2023.
//

import UIKit

// MARK: - Protocol Presenter

protocol IngredientAnimationPresenterProtocol {
    var recipe: Recipe { get }
}

// MARK: - Class IngredientAnimationPresenter

class IngredientAnimationPresenter: IngredientAnimationPresenterProtocol {
    
// MARK: - Properties
    
    var recipe: Recipe
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    private let coreData: CoreDataStoreProtocol

// MARK: - Init
    
    init(navigator: NavigatorProtocol,
         networking: NetworkingProtocol,
         recipe: Recipe,
         coreData: CoreDataStoreProtocol) {
        self.navigator = navigator
        self.networking = networking
        self.recipe = recipe
        self.coreData = coreData
    }
}
