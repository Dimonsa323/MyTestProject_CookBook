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
}

// MARK: - Class

class ListRecipiesPresenter {
    
// MARK: - Properties

    let hits: [Hits] = []
    let menuModel: MenuModel
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    
// MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol, menuModel: MenuModel) {
        self.navigator = navigator
        self.networking = networking
        self.menuModel = menuModel
    }
}

// MARK: - Private Extension 

extension ListRecipiesPresenter: ListRecipiesPresenterProtocol {
    
    
}
