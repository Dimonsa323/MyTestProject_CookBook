//
//  FoodMenuPresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 09.01.2023.
//

import Foundation
import UIKit

// MARK: - Protocol Presenter

protocol FoodMenuPresenterProtocol {
    var hits: [Hits] { get }
    var menuModel: [MenuModel] { get }
    
    func showListRecipiesVC(view: UIViewController, indexPath: IndexPath, screenType: ScreenType)}

// MARK: - Class FoodMenuPresenter

class FoodMenuPresenter {
    
// MARK: - Properties
    
    let hits: [Hits] = []
    let menuModel = MenuModel.allCases
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    
// MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol) {
        self.networking = networking
        self.navigator = navigator
    }
}

// MARK: - Private Extension 

extension FoodMenuPresenter: FoodMenuPresenterProtocol {
    func showListRecipiesVC(view: UIViewController, indexPath: IndexPath, screenType: ScreenType) {
        let menuFood = menuModel[indexPath.item]
        navigator.showListVC(view: view, menuModel: menuFood, screenType: screenType)
    }
}
