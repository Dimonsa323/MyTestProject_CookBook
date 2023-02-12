//
//  IngredientsVC.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 12.01.2023.
//

import UIKit
import SnapKit

class IngredientsVC: UIViewController {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageFood: ImageView!
    @IBOutlet weak var caloriesFood: UILabel!
    @IBOutlet weak var weightFood: UILabel!
    @IBOutlet weak var cookingTime: UILabel!
    
// MARK: - Properties
    
    private let presenter: IngredientsPresenter
    private let ingredientCell: String = String(describing: IngredientsCell.self)
    
// MARK: - Init
    
    init(presenter: IngredientsPresenter) {
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
        imageFood.layer.cornerRadius = 8
    }
}

// MARK: - Private Extension

extension IngredientsVC {
    
    func setupUI() {
        setupTableView()
        setupNavigationController()
        setupDetailRecipe()
        
    }
    
    func setupTableView() {
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(.init(nibName: ingredientCell, bundle: nil), forCellReuseIdentifier: ingredientCell)
    }
    
    func setupDetailRecipe() {
        imageFood.fetchImage(from: presenter.type.image)
        
        caloriesFood.text = String(format: "Calories: %.0f",
                                    presenter.type.calories) + " " + "Cal"
        weightFood.text = String(format: "Weight: %.0f",
                                  presenter.type.totalWeight) + " " + "grams"
        cookingTime.text = String(format: "Time: %.0f" ,
                                presenter.type.totalTime) + " " + "min"
    }
    
        func setupNavigationController() {
            setupNavBar()
            title = presenter.type.label
            navigationItem.largeTitleDisplayMode = .never
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        func setupNavBar() {
            let image = UIImage(named: presenter.isFavorite ? "icon_favourite_dont_fill" : "icon_favourite_fill")
            
            let rightBarButtonItem = UIBarButtonItem(image: image,
                                                     style: .plain,
                                                     target: self,
                                                     action: #selector(didTapRecipe))
            navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    
    @objc
    func didTapRecipe() {
        presenter.isFavorite.toggle()
        setupNavBar()
        presenter.saveIngredientsInCoreData()
    }
}

extension IngredientsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showAnimationVC(view: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.type.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ingredientCell, for: indexPath) as! IngredientsCell
        let ingredientRecipe = presenter.type.ingredients[indexPath.row]
        cell.config(with: ingredientRecipe)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let titleButton = UIButton()
        titleButton.backgroundColor = UIColor(named: "Rose")
        titleButton.setTitleColor(.black, for: .normal)
        titleButton.setTitle("Full Recipe", for: .normal)
        titleButton.layer.cornerRadius = 6
        titleButton.addTarget(self, action: #selector(touchUpFullRecipe), for: .touchUpInside)
        
        
        return titleButton
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.init(name: "SFProText-Semibold", size: 34)
        titleLabel.backgroundColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        titleLabel.text = "Ingredients"
        
        let view = UIView()
        view.backgroundColor = .clear
        
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        return view
    }
}

extension IngredientsVC {
    
    @objc
    private func touchUpFullRecipe() {
        presenter.showWebViewVC(view: self)
    }
}
