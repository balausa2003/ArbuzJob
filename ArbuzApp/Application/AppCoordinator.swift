import UIKit

/// Define what type of flows can be started from this Coordinator
protocol AppCoordinatorProtocol: Coordinator {
    func showMainFlow()
}

/// App coordinator is the only one coordinator which will exist during app's life cycle
class AppCoordinator: AppCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .app }
        
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }

    func start() {
        showMainFlow()
    }

    func showMainFlow() {
        // Implement Main (Tab bar) FLow
        let tabCoordinator = TabCoordinator.init(navigationController)
        tabCoordinator.finishDelegate = self

        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })

        switch childCoordinator.type {
        case .app:
            navigationController.viewControllers.removeAll()
            showMainFlow()
        default:
            break
        }
    }
}
