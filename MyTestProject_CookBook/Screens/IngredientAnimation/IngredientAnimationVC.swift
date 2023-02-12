//
//  IngredientAnimationVC.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 16.01.2023.
//

import UIKit

// MARK: - Class IngredientAnimationVC

class IngredientAnimationVC: UIViewController {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var imageView: ImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
// MARK: - Properties
    
    let viewToAnimate = UIView()
    private let presenter: IngredientAnimationPresenterProtocol
    
// MARK: - Init
    
    init(presenter: IngredientAnimationPresenterProtocol) {
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
        UIView.animate(withDuration: 2, delay: 0.2, options: .curveEaseIn, animations: {
            self.imageView.center = self.view.center
         //   self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
          //  self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 2)
            self.imageView.transform = CGAffineTransform.identity
        }) { _ in
        }
    }
}

// MARK: - Private Extension 

extension IngredientAnimationVC {
    func setupUI() {
        imageView.fetchImage(from: presenter.recipe.image)
        caloriesLabel.text = String(format: "Calories: %.0f",
                                    presenter.recipe.calories) + " " + "Cal"
        weightLabel.text = String(format: "Weight: %.0f",
                                  presenter.recipe.totalWeight) + " " + "grams"
        timeLabel.text = String(format: "Time: %.0f" ,
                                presenter.recipe.totalTime) + " " + "min"
    }
}
