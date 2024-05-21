import UIKit
import SwiftUI

class BasketViewController: UIViewController {
    let viewModel = BasketViewModel()

    private lazy var basketView: UIViewController = {
        let basketView = BasketView(action: {
            let loadingView = LoadingView {
                let vc = PaymentViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            let loadingViewController = UIHostingController(rootView: loadingView)
            self.navigationController?.pushViewController(loadingViewController, animated: true)
        })
        return UIHostingController(rootView: basketView)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSwiftUI(basketView)
    }
    
    deinit {
        print("BasketViewController deinit")
    }
}
