//
//  ProfilePresenter.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 11.01.2023.
//

import UIKit

// MARK: - Protocol Presenter

protocol ProfilePresenterProtocol {
    func showLinkedin(view: UIViewController)
}

// MARK: - Class ProfilePresenter

class ProfilePresenter {
    
// MARK: - Properties
    
    let urlLinkedin = "https://www.linkedin.com/in/%D0%B4%D0%BC%D0%B8%D1%82%D1%80%D0%BE-%D0%B3%D1%83%D0%B1%D0%B5%D0%BD%D1%8F-38779a254/"
    
    private let navigator: NavigatorProtocol
    
// MARK: - Init
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
}

// MARK: - Private Extension 

extension ProfilePresenter: ProfilePresenterProtocol {
    func showLinkedin(view: UIViewController) {
        navigator.showWebView(view: view, url: urlLinkedin)
    }
}
