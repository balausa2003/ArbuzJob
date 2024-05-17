//
//  HomeViewController.swift
//  ArbuzApp
//
//  Created by Балауса Косжанова on 16.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeView: UIViewController = {
        HomeView().convertSwiftUIToHosting()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSwiftUI(homeView)
        

    }
    deinit {
        print("SteadyViewController deinit")
    }
}
