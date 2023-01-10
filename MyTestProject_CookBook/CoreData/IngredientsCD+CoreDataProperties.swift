//
//  IngredientsCD+CoreDataProperties.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 09.01.2023.
//
//

import Foundation
import CoreData


extension IngredientsCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngredientsCD> {
        return NSFetchRequest<IngredientsCD>(entityName: "IngredientsCD")
    }

    @NSManaged public var text: String?
    @NSManaged public var image: String?
    @NSManaged public var favoriteRecipe: NSSet?

}

// MARK: Generated accessors for favoriteRecipe
extension IngredientsCD {

    @objc(addFavoriteRecipeObject:)
    @NSManaged public func addToFavoriteRecipe(_ value: FavoriteRecipeCD)

    @objc(removeFavoriteRecipeObject:)
    @NSManaged public func removeFromFavoriteRecipe(_ value: FavoriteRecipeCD)

    @objc(addFavoriteRecipe:)
    @NSManaged public func addToFavoriteRecipe(_ values: NSSet)

    @objc(removeFavoriteRecipe:)
    @NSManaged public func removeFromFavoriteRecipe(_ values: NSSet)

}

extension IngredientsCD : Identifiable {

}
