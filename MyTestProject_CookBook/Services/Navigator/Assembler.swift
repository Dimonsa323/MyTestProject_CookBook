//
//  Assembler.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 07.01.2023.
//

import Foundation
import UIKit

class Assembler {
    
    private let networking = Networking()
    private let coreData = CoreDataStore()
    
    func createStartVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = StartPresenter(navigator: navigator, networking: networking)
        let vc = StartVC(presenter: presenter)
        
        return vc 
    }
    
    func createFlowController(navigator: NavigatorProtocol) -> UIViewController {
        
        let vc = FlowController(networking: networking, navigator: navigator)
        
        return vc
    }
    
    func createListRecipiesVC(navigator: NavigatorProtocol, menuModel: MenuModel) -> UIViewController {
        let presenter = ListRecipiesPresenter(navigator: navigator, networking: networking, menuModel: menuModel)
        let vc = ListRecipiesVC(presenter: presenter)
        
        return vc 
    }
}
