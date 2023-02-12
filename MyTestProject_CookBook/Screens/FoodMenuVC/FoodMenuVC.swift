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
    private let createCell: String = String(describing: MenuCell.self)
    
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

// MARK: - Private Extension

extension FoodMenuVC {
    func setupUI() {
        setupCollectionView()
        setupNavigationController()
    }
    
    func setupCollectionView() {
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(nibName: createCell, bundle: nil),
                                forCellWithReuseIdentifier: createCell)
    }
    
    func setupNavigationController() {
        title = "Recipies"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FoodMenuVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
    -> Int {
        presenter.menuModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: createCell,
                                                      for: indexPath) as! MenuCell
        let menuModel = presenter.menuModel[indexPath.item]
        cell.config(type: menuModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.showListRecipiesVC(view: self, indexPath: indexPath, screenType: .internetRecipe)
    }
}

extension FoodMenuVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 16, height: 150)
    }
}
