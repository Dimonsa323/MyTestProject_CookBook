//
//  IngredientsPresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 12.01.2023.
//

import UIKit

// MARK: - Protocol Presenter

protocol IngredientsPresenterProtocol {
    var type: Recipe { get }
    var isFavorite: Bool { get set }
    func checkIfElementInCD()
    func saveIngredientsInCoreData()
}

// MARK: - Class IngredientsPresenter

class IngredientsPresenter {
    
// MARK: - Properties
    
    var isFavorite: Bool = false
    var type: Recipe
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    private let coreData: CoreDataStoreProtocol
    
// MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol,
         coreData: CoreDataStoreProtocol, type: Recipe) {
        self.navigator = navigator
        self.networking = networking
        self.coreData = coreData
        self.type = type
        
        checkIfElementInCD()
    }
    
// MARK: - Method
    
    func checkIfElementInCD() {
        isFavorite = coreData.fetchRequestIfConsistElement(with: type.label)
    }
}

// MARK: - Private Extension 

extension IngredientsPresenter: IngredientsPresenterProtocol {
    
    func saveIngredientsInCoreData() {
        guard !coreData.fetchRequestIfConsistElement(with: type.label) else {
            coreData.deleteRecipe(with: type.label)
            
            return
        }

        let recipeCD = FavoriteRecipeCD(context: coreData.context)
        recipeCD.label = type.label
        recipeCD.image = type.image
        recipeCD.totalTime = type.totalTime
        recipeCD.totalWeight = type.totalWeight
        recipeCD.calories = type.calories
        recipeCD.source = type.source
        recipeCD.url = type.url
        
        type.ingredients.forEach { ingredient in
            let dataBaseIngredient = IngredientsCD(context: self.coreData.context)
            dataBaseIngredient.text = ingredient.text
            dataBaseIngredient.image = ingredient.image
            recipeCD.addToIngredients(dataBaseIngredient)
        }
        
        coreData.saveContext()
    }
    
    func showWebViewVC(view: UIViewController) {
        navigator.showWebView(view: view, url: type.url)
    }
}

