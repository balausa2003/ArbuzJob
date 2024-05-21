//
//  PaymentViewController.swift
//  ArbuzApp
//
//  Created by Балауса Косжанова on 21.05.2024.
//

import UIKit

class PaymentViewController: UIViewController {
    
    
    private lazy var paymentView: UIViewController = {
        PaymentView().convertSwiftUIToHosting()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSwiftUI(paymentView)
        

    }
    deinit {
        print("SteadyViewController deinit")
    }
}
