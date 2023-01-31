//
//  WebPresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 25.01.2023.
//

import Foundation
import UIKit

// MARK: - Protocol Presenter

protocol WebPresenterProtocol {
    
}

// MARK: - Class

class WebPresenter {
    
// MARK: - Properties
    
    private let navigator: NavigatorProtocol
    
// MARK: - Init
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
}

// MARK: - Private Extension

extension WebPresenter: WebPresenterProtocol {
}
