//
//  Navigator.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 07.01.2023.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func showStartVC() -> UIViewController
    func showTabBar(view: UIViewController)
    func showListVC(view: UIViewController, menuModel: MenuModel, screenType: ScreenType)
    func showIngredientsRecipe(view: UIViewController, type: Recipe)
    func showWebView(view: UIViewController, url: String)
    func showIngredientsAnimationVC(view: UIViewController, recipe: Recipe)
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    
    func showStartVC() -> UIViewController {
        let vc = assembler.createStartVC(navigator: self)
        
        return vc
    }
    
    func showTabBar(view: UIViewController) {
        let vc = assembler.createFlowController(navigator: self)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        view.navigationController?.present(vc, animated: true)
    }
    
    func showListVC(view: UIViewController, menuModel: MenuModel, screenType: ScreenType) {
        let vc = assembler.createListRecipiesVC(navigator: self, menuModel: menuModel, screenType: screenType)
        vc.hidesBottomBarWhenPushed = true
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showIngredientsRecipe(view: UIViewController, type: Recipe) {
        let vc = assembler.createIngredientsVC(navigator: self, type: type)
        
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showWebView(view: UIViewController, url: String) {
        let vc = assembler.webViewRecipe(url: url, navigator: self)
        view.hidesBottomBarWhenPushed = true
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showIngredientsAnimationVC(view: UIViewController, recipe: Recipe) {
        let vc = assembler.showAnimationView(navigator: self, recipe: recipe)
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
