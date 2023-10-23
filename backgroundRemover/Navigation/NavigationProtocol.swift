//
//  NavigationProtocol.swift
//  backgroundRemover
//
//  Created by N S on 23.10.2023.
//

import UIKit

protocol NavigationProtocol: AnyObject {
    var navigationController: UINavigationController? { get }
    var topViewController: UIViewController? { get }
    var controllerFactory: ModuleBuilderProtocol { get }
    
    func navigationPresent(_ controller: UIViewController, style: UIModalPresentationStyle, animated: Bool)
    func navigationPushViewController(_ controller: UIViewController, animated: Bool)
    func navigationPopViewController(animated: Bool)
    func navigationPopToRootViewController(animated: Bool)
}

extension NavigationProtocol {
    var topViewController: UIViewController? {
        self.navigationController?.visibleViewController
    }
    
    func navigationPresent(_ controller: UIViewController, style: UIModalPresentationStyle = .overCurrentContext, animated: Bool) {
        controller.modalPresentationStyle = style
        if let topVC = self.topViewController {
            topVC.present(controller, animated: animated)
            return
        }
        navigationController?.present(controller, animated: animated)
    }
    
    func navigationSetViewController(_ controller: UIViewController, animated: Bool) {
        navigationController?.setViewControllers([controller], animated: animated)
    }
    
    func navigationPushViewController(_ controller: UIViewController, animated: Bool) {
        navigationController?.pushViewController(controller, animated: animated)
    }
    
    func navigationPopViewController(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    func navigationPopToRootViewController(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
}
