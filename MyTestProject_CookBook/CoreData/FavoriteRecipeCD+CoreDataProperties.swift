//
//  FavoriteRecipeCD+CoreDataProperties.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 09.01.2023.
//
//

import Foundation
import CoreData


extension FavoriteRecipeCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteRecipeCD> {
        return NSFetchRequest<FavoriteRecipeCD>(entityName: "FavoriteRecipeCD")
    }

    @NSManaged public var url: String?
    @NSManaged public var totalWeight: Double
    @NSManaged public var totalTime: Double
    @NSManaged public var source: String?
    @NSManaged public var label: String?
    @NSManaged public var image: String?
    @NSManaged public var id: UUID?
    @NSManaged public var calories: Double
    @NSManaged public var ingredients: NSSet?

}

// MARK: Generated accessors for ingredients
extension FavoriteRecipeCD {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: IngredientsCD)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: IngredientsCD)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

extension FavoriteRecipeCD : Identifiable {

}
