//
//  StartPresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 07.01.2023.
//

import Foundation
import UIKit

// MARK: - protocol StartPresenterProtocol

protocol StartPresenterProtocol {
    
}

// MARK: - Class StartPresenter

class StartPresenter: StartPresenterProtocol {
    
    // MARK: - Properties
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
}

// MARK: - Private Extension

private extension StartPresenter {
    
    func showTabBar() {
        
    }
}
