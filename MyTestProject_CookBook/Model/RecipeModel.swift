//
//  RecipeModel.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 09.01.2023.
//

import Foundation

struct FoodMenu: Decodable {
    let hits: [Hits]
}

struct Hits: Decodable {
    let recipe: Recipe
}

struct Recipe: Decodable {
    let label: String
    let image: String
    let source: String
    let url: String
    let calories: Double
    let totalWeight: Double
    let ingredients: [Ingredients]
    let totalTime: Double
    let recipeID: UUID?
    
    init(label: String, image: String, source: String, calories: Double,
         totalWeight: Double, totalTime: Double, ingredients: [Ingredients], url: String) {
        self.label = label
        self.image = image
        self.source = source
        self.calories = calories
        self.totalWeight = totalWeight
        self.totalTime = totalTime
        self.ingredients = ingredients
        self.recipeID = UUID()
        self.url = url
    }
    
    init(recipe: FavoriteRecipeCD) {
        self.label = recipe.label ?? ""
        self.image = recipe.image ?? ""
        self.source = recipe.source ?? ""
        self.calories = recipe.calories
        self.totalWeight = recipe.totalWeight
        self.totalTime = recipe.totalTime
        self.recipeID = recipe.id ?? UUID()
        self.url = recipe.url ?? ""
        
        let ingredientCD = recipe.ingredients.array(of: IngredientsCD.self)
        let appIngrediens = ingredientCD.map { Ingredients(ingredientCD: $0) }
        
        self.ingredients = appIngrediens
        }
    }

struct Ingredients: Decodable, Hashable {
    let text: String
    let image: String?
    
    init(text: String, image: String) {
        self.image = image
        self.text = text
    }
    
    init(ingredientCD: IngredientsCD) {
        self.text = ingredientCD.text ?? ""
        self.image = ingredientCD.image
    }
}

extension Optional where Wrapped == NSSet {
    func array<T: Hashable>(of: T.Type) -> [T] {
        if let set = self as? Set<T> {
            return Array(set)
        }
        return [T]()
    }
}
