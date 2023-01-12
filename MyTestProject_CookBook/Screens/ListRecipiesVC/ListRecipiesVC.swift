//
//  ListRecipiesVC.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 11.01.2023.
//

import UIKit

// MARK: - Class ListRecipiesVC

class ListRecipiesVC: UIViewController {

// MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!

// MARK: - Properties
    
    private let presenter: ListRecipiesPresenterProtocol

// MARK: - Init
    
    init(presenter: ListRecipiesPresenterProtocol) {
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

private extension ListRecipiesVC {
    func setupUI() {
        setupTableView()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let navBar = presenter.menuModel.navTitle
        title = navBar
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupTableView() {
        
    }
}
