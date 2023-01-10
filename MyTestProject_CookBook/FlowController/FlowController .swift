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
    
    init(networking: NetworkingProtocol, navigator: NavigatorProtocol) {
        self.networking = networking
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
