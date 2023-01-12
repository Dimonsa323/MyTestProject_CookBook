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
}

// MARK: - Class FoodMenuPresenter

class FoodMenuPresenter: FoodMenuPresenterProtocol  {
    
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
