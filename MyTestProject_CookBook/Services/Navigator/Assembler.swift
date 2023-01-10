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
    
    func showFlowController(navigator: NavigatorProtocol) -> UIViewController {
        
        let vc = FlowController(networking: networking, navigator: navigator)
        
        return vc
    }
}
