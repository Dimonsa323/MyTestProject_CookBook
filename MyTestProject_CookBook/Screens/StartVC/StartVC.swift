//
//  StartVC.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 07.01.2023.
//

import UIKit

// MARK: - Class StartVC

class StartVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var uiView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var enterUIButton: UIButton!
    
// MARK: - Properties
    
  private let presenter: StartPresenterProtocol
    
// MARK: - Init
    
    init(presenter: StartPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Extension

private extension StartVC {
    
    func setupUI() {
        let welcomeText: String = """
Wellcome !
Looking for a great home-cooked meal?
Log in these app, and you'll be cooking it up in no time
"""
        uiView.alpha = 0.4
        enterUIButton.layer.cornerRadius = 6
        textLabel.text = welcomeText
        textLabel.textAlignment = .left
    }
}

private extension StartVC {
    
    @IBAction func enterButton() {
        presenter.showTabBar(view: self)
    }
}
