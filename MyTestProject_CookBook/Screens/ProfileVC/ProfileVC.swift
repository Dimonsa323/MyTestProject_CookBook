//
//  ProfileVC.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 11.01.2023.
//

import UIKit

// MARK: - Class ProfileVC

class ProfileVC: UIViewController {
    
// MARK: - Outlet
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    
// MARK: - Properties
    
    private let presenter: ProfilePresenterProtocol
    
// MARK: - Init
    
    init(presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        imageProfile.layer.cornerRadius = 16
        profileButton.layer.cornerRadius = 6
    }
}

// MARK: - Private Extension 

extension ProfileVC {
    
    @IBAction func infoButton(_ sender: Any) {
        presenter.showLinkedin(view: self)
    }
}
