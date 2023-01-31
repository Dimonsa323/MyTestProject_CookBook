//
//  ListRecipiesPresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 11.01.2023.
//

import UIKit

// MARK: - Protocol Presenter

protocol ListRecipiesPresenterProtocol {
    var hits: [Hits] { get }
    var menuModel: MenuModel { get }
    var screenType: ScreenType { get }
    
    func getInfo()
    func getRecipeCD()
    func showIngredientsVC(with recipe: Recipe, view: UIViewController)
    func listVC(view: ListRecipiesProtocol)
    func deleteRecipeInDataBase(indexPath: IndexPath, closure: () -> Void)
}

// MARK: - Class

class ListRecipiesPresenter {
    
// MARK: - Properties

    var hits: [Hits] = []
    var menuModel: MenuModel
    var view: ListRecipiesProtocol!
    let screenType: ScreenType
    let coreData: CoreDataStoreProtocol
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    
// MARK: - Init
    
    init(navigator: NavigatorProtocol,
         networking: NetworkingProtocol,
         menuModel: MenuModel,
         screenType: ScreenType,
         coreData: CoreDataStoreProtocol) {
        self.navigator = navigator
        self.networking = networking
        self.menuModel = menuModel
        self.screenType = screenType
        self.coreData = coreData
    }
}

// MARK: - Private Extension 

extension ListRecipiesPresenter: ListRecipiesPresenterProtocol {
    
    func listVC(view: ListRecipiesProtocol) {
        self.view = view
    }
    
    func getInfo() {
        networking.getModel(type: menuModel) { hit in
            self.hits = hit
            self.view?.reload()
        }
    }
    
    func getRecipeCD() {
        coreData.fetchRequest { [weak self] recipe in
            let likedRecipies = recipe.map(Recipe.init(recipe:))
            let hits = likedRecipies.map { Hits(recipe: $0) }
            self?.hits = hits
            self?.view?.reload()
        }
    }
    
    func showIngredientsVC(with recipe: Recipe, view: UIViewController) {
        navigator.showIngredientsRecipe(view: view, type: recipe)
    }
    
    func deleteRecipeInDataBase(indexPath: IndexPath, closure: () -> Void) {
        
        coreData.deleteRecipe(with: hits[indexPath.row].recipe.label)
        hits.remove(at: indexPath.row)
//        guard let id = hits[indexPath.row].recipe.recipeID else {
//            return
//        }
//        coreData.deleteRecipe(id: id)
//        hits.remove(at: indexPath.row)
        
        coreData.saveContext()
        
        closure()
    }
}
