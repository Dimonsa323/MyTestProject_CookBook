//
//  ListRecipiesVC.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 11.01.2023.
//

import UIKit

// MARK: - Protocol Presenter 

protocol ListRecipiesProtocol {
    
    func reload()
}

// MARK: - Class ListRecipiesVC

class ListRecipiesVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    
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
        
        if presenter.screenType == .internetRecipe {
            presenter.getInfo()
        } else {
            presenter.getRecipeCD()
        }
            
        view.showActivityIndicator()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        if presenter.screenType == .favoriteRecipe {
            presenter.getRecipeCD()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showIngredientsVC(with: presenter.hits[indexPath.row].recipe, view: self)
    }
}

extension ListRecipiesVC: ListRecipiesProtocol {
    
    func reload() {
        tableView.reloadData()
        view.hideActivityIndicatorView()
        
        UIView.animate(withDuration: 1) {
            self.tableView.layer.opacity = 1
            if self.presenter.screenType == .favoriteRecipe {
                self.emptyLabel.isHidden = !self.presenter.hits.isEmpty
            }
        }
    }
}
