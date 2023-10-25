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
    
    func routeToMainController() {
        guard let mainController = controllerFactory.createMainController(coordinator: self) else { return }
        navigationController = UINavigationController(rootViewController: mainController)
        navigationController?.isNavigationBarHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func switchToMainController() {
        guard let mainController = controllerFactory.createMainController(coordinator: self) else { return }
        navigationController?.pushViewController(mainController, animated: true)
    }
    
    func routeToMediaController(_ image: UIImage) {
        guard let mediaController = controllerFactory.createMediaController(coordinator: self, image: image) else { return }
        navigationController?.pushViewController(mediaController, animated: true)
    }
}
