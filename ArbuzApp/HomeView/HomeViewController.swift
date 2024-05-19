//
//  HomeViewController.swift
//  ArbuzApp
//
//  Created by Балауса Косжанова on 16.05.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    private lazy var homeView: UIViewController = {
        HomeView(viewModel: viewModel).convertSwiftUIToHosting()
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
