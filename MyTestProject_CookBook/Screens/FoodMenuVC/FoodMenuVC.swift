//
//  FoodMenuVC.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 09.01.2023.
//

import UIKit

// MARK: - Class FoodMenuVC

class FoodMenuVC: UIViewController {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
// MARK: - Properties
    
    private let presenter: FoodMenuPresenterProtocol
    
// MARK: - Init
    
    init(presenter: FoodMenuPresenterProtocol) {
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

extension FoodMenuVC {
    func setupUI() {
        setupCollectionView()
        setupNavigationController()
    }
    
    func setupCollectionView() {
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
    }
    
    func setupNavigationController() {
        title = "Recipies"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Private Extension

extension FoodMenuVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
