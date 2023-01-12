//
//  ProfilePresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 11.01.2023.
//

import UIKit

protocol ProfilePresenterProtocol {
    
}

class ProfilePresenter {
    
    private let navigator: NavigatorProtocol
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
}

extension ProfilePresenter: ProfilePresenterProtocol {
    
}
