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
    
    func showFlowController(navigator: NavigatorProtocol) -> UIViewController {
        
        let vc = FlowController(networking: networking, navigator: navigator)
        
        return vc
    }
}