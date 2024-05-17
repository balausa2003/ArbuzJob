//
//  MainTabBarViewController.swift
//  ArbuzApp
//
//  Created by Балауса Косжанова on 16.05.2024.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    let homeVC = UINavigationController(rootViewController: HomeViewController())
    let basketVC = UINavigationController(rootViewController: HomeViewController())


    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([homeVC,basketVC], animated: true)
        homeVC.tabBarItem = UITabBarItem(title: "Главное", image: UIImage(named: "home"), tag: 0)
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "basket"), tag: 1)
        self.tabBar.tintColor = UIColor(Colors.greenColor)
        self.tabBar.unselectedItemTintColor = UIColor(Colors.grayColor)
        
        //
//        let homeVC = HomeViewController()
//        homeVC.tabBarItem = UITabBarItem(title: "Главное", image: UIImage(named: "home"), tag: 0)
//        
//        let basketVC = BasketViewController()
//        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(named: "basket"), tag: 1)
//        
        viewControllers = [homeVC, basketVC]
       
    }

}
