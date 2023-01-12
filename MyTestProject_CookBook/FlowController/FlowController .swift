//
//  FlowController .swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 09.01.2023.
//

import Foundation
import UIKit

// MARK: - Class FlowController

final class FlowController: UIViewController, UITabBarControllerDelegate {
    
// MARK: - Properties
    
    private let tabBarVC: UITabBarController = UITabBarController()
    private let networking: NetworkingProtocol
    private let navigator: NavigatorProtocol
    
    private lazy var menuScreen: UINavigationController = instantiateFoodMenuVC()
    private lazy var favoriteScreen: UINavigationController = instantiateFavoriteVC()
    private lazy var profileScreen: UINavigationController = instantiateProfileVC()
    
// MARK: - Init
    
    init(networking: NetworkingProtocol, navigator: NavigatorProtocol) {
        self.networking = networking
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setUIAppearanceCustomNavBar(type: .opaque)
        TabBarAppearance.shared.setAppearance()
        setupVCs()
    }
}

// MARK: - Private Extension

private extension FlowController {
    
    func setupVCs() {
        tabBarVC.navigationController?.setViewControllers([menuScreen, favoriteScreen, profileScreen], animated: true)
    }
    
    func instantiateFoodMenuVC() -> UINavigationController {
        let presenter = FoodMenuPresenter(navigator: navigator, networking: networking)
        let vc = FoodMenuVC(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Recipies", image: UIImage(named: "bookWhite"), selectedImage: UIImage(named: "bookPurple"))
        
        return navigator
        }
    
    func instantiateFavoriteVC() -> UINavigationController {
        let presenter = ListRecipiesPresenter(navigator: navigator, networking: networking, menuModel: .meat)
        let vc = ListRecipiesVC(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "icon_favourite_fill"), selectedImage: UIImage(named: "icon_favourite_dont_fill"))
        
        return navigator
    }
    
    func instantiateProfileVC() -> UINavigationController {
        let presenter = ProfilePresenter(navigator: navigator)
        let vc = ProfileVC(presenter: presenter)
        let navigator = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Profile", image: UIImage(named: "Profile 1"), selectedImage: UIImage(named: "profilePurple"))
        
        return navigator
    }
    
    func initialSetup() {
        view.backgroundColor = .black
        tabBarVC.delegate = self
        tabBarVC.viewControllers = [menuScreen, favoriteScreen, profileScreen]
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.unselectedItemTintColor = .white
        addChild(tabBarVC, toContainer: view)
    }
}
    
    

