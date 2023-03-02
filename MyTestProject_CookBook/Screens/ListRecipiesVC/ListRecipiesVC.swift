//
//  ListRecipiesVC.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 11.01.2023.
//

import UIKit

// MARK: - Protocol Presenter 

protocol ListRecipiesProtocol {
    func setupTitle(title: String)
    func reload()
}

// MARK: - Class ListRecipiesVC

class ListRecipiesVC: UIViewController {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    // MARK: - Properties
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private let presenter: ListRecipiesPresenterProtocol
    private let listCell: String = String(describing: ListRecipiesCell.self)
    private let searchController = UISearchController(searchResultsController: nil)
    
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
        }
        
        view.showActivityIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if presenter.screenType == .favoriteRecipe {
            presenter.getRecipeCD()
            setupTitle(title: "Favorite recipes")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Private Extension

private extension ListRecipiesVC {
    func setupUI() {
        setupTableView()
        setupNavigationBar()
        setupSearch()
    }
    
    func setupSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func setupNavigationBar() {
        
        let navBar = presenter.menuModel.navTitle
        
        if presenter.screenType == .internetRecipe {
            title = navBar
        }
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupTableView() {
        tableView.showsVerticalScrollIndicator = false
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
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if self.presenter.screenType == .favoriteRecipe {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete")
            { _, _, closure in
                self.presenter.deleteRecipeInDataBase(indexPath: indexPath) {
                    
                    DispatchQueue.main.async {
                        self.tableView.deleteRows(at: [indexPath], with: .automatic)
                        self.reload()
                    }
                }
                
                closure(true)
            }
            
            deleteAction.image = UIImage(systemName: "trash")!
            deleteAction.backgroundColor = .systemRed
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = true
            
            return configuration
        } else {
            return nil
        }
    }
}

extension ListRecipiesVC: ListRecipiesProtocol {
    
    func setupTitle(title: String) {
        navigationItem.title = title
    }
    
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

extension ListRecipiesVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        presenter.filterContentForSearchText(
            searchText: searchController.searchBar.text ?? "",
            isFiltering: isFiltering
        )
    }
}
