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
    func getInfo(closure: @escaping () -> Void)
}

// MARK: - Class

class ListRecipiesPresenter {
    
// MARK: - Properties

    var hits: [Hits] = []
    var menuModel: MenuModel
    
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
    
    func getInfo(closure: @escaping () -> Void) {
        networking.getModel(type: menuModel) { hit in
            self.hits = hit
            closure()
        }
    }
}
