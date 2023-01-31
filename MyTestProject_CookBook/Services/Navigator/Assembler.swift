//
//  Assembler.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 07.01.2023.
//

import Foundation
import UIKit

class Assembler {
    
    private let networking = Networking()
    private let coreData = CoreDataStore()
    
    func createStartVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = StartPresenter(navigator: navigator, networking: networking)
        let vc = StartVC(presenter: presenter)
        
        return vc 
    }
    
    func createFlowController(navigator: NavigatorProtocol) -> UIViewController {
        
        let vc = FlowController(networking: networking, navigator: navigator, coreData: coreData)
        
        return vc
    }
    
    func createListRecipiesVC(navigator: NavigatorProtocol, menuModel: MenuModel, screenType: ScreenType) -> UIViewController {
        let presenter = ListRecipiesPresenter(navigator: navigator, networking: networking, menuModel: menuModel, screenType: screenType, coreData: coreData)
        let vc = ListRecipiesVC(presenter: presenter)
        presenter.listVC(view: vc)
        
        return vc 
    }
    
    func createIngredientsVC(navigator: NavigatorProtocol, type: Recipe) -> UIViewController {
        let presenter = IngredientsPresenter(navigator: navigator, networking: networking,
                                             coreData: coreData, type: type)
        let vc = IngredientsVC(presenter: presenter)
        
        return vc 
    }
    
    func webViewRecipe(url: String, navigator: NavigatorProtocol) -> UIViewController {
        let presenter = WebPresenter(navigator: navigator)
        let vc = WebView(url: url, presenter: presenter)
        
        return vc
    }
    
    func showAnimationView(navigator: NavigatorProtocol, recipe: Recipe) -> UIViewController {
        let presenter = IngredientAnimationPresenter(navigator: navigator, networking: networking, recipe: recipe, coreData: coreData)
        let vc = IngredientAnimationVC(presenter: presenter)
        
        return vc
    }
}
