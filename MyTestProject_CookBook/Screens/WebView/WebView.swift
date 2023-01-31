//
//  WebView.swift
//  MyTestProject_CookBook
//
//  Created by Дима Губеня on 16.01.2023.
//

import UIKit
import WebKit

// MARK: - Protocol

protocol WebViewProtocol {
    
}

// MARK: - Class FullRecipeVC

class WebView: UIViewController, WKNavigationDelegate, WebViewProtocol {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var webView: WKWebView!
    
// MARK: - Properties
    
    private let url: String
    private let presenter: WebPresenter
    
// MARK: - Init
    
    init(url: String, presenter: WebPresenter) {
        self.url = url
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func loadView() {
//        setupNavBar()
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        view = webView
//    }
//
// MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        guard let urlInfo = URL(string: url)  else { return }
        webView.load(URLRequest(url: urlInfo))
        webView.allowsBackForwardNavigationGestures = true
    }
}

// MARK: - Private Extension

extension WebView {
    func setupNavBar() {
        let leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                style: .plain,
                                                target: self,
                                                action: #selector(didTapUser))
            
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc
    func didTapUser() {
        navigationController?.popViewController(animated: true)
    }
}
