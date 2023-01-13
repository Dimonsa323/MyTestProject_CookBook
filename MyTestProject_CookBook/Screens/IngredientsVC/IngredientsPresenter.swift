//
//  IngredientsPresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 12.01.2023.
//

import UIKit

protocol IngredientsPresenterProtocol {
    
}

class IngredientsPresenter {
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
}

extension IngredientsPresenter: IngredientsPresenterProtocol {
    
}

