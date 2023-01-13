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
    private let listCell: String = String(describing: ListRecipiesCell.self)

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
        presenter.getInfo {
            self.tableView.reloadData()
            UIView.animate(withDuration: 1) {
                self.tableView.layer.opacity = 1
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        hidesBottomBarWhenPushed = false
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
        tableView.layer.opacity = 0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: listCell, bundle: nil), forCellReuseIdentifier: listCell)
    }
}

// MARK: - Private Extension

extension ListRecipiesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.hits.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: listCell, for: indexPath) as! ListRecipiesCell
        let recipe = presenter.hits[indexPath.row]
        cell.config(with: recipe.recipe)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
