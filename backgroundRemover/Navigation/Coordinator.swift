//
//  Coordinator.swift
//  backgroundRemover
//
//  Created by N S on 23.10.2023.
//

import UIKit

final class Coordinator: NavigationProtocol {
    var navigationController: UINavigationController?
    let controllerFactory: ModuleBuilderProtocol
    private let window: UIWindow
    init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
        controllerFactory = ModuleBuilder()
    }
    
    func start() {
        guard let firstController = controllerFactory.createFirstController(coordinator: self) else { return }
        navigationController = UINavigationController(rootViewController: firstController)
        navigationController?.isNavigationBarHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
