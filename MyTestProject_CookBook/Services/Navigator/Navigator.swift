//
//  Navigator.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 07.01.2023.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func showTabBar(view: UIViewController) 
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    
    func showStartVC() -> UIViewController {
        let vc = assembler.createStartVC(navigator: self)
        
        return vc
    }
    
    func showTabBar(view: UIViewController) {
        let vc = assembler.showFlowController(navigator: self)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        view.navigationController?.present(vc, animated: true)
    }
}
