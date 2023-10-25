//
//  ModuleBuilder.swift
//  backgroundRemover
//
//  Created by N S on 23.10.2023.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    func createFirstController(coordinator: Coordinator) -> UIViewController?
    func createMainController(coordinator: Coordinator) -> UIViewController?
    func createPhotoPickerController(coordinator: Coordinator) -> UIViewController?
}

final class ModuleBuilder: ModuleBuilderProtocol {
    func createFirstController(coordinator: Coordinator) -> UIViewController? {
        let controller = OnboardingController()
        let presenter = OnboardingPresenter()
        presenter.coordinator = coordinator
        controller.presenter = presenter
        return controller
    }
    
    func createMainController(coordinator: Coordinator) -> UIViewController? {
        let controller = MainController()
        let presenter = MainPresenter()
        presenter.coordinator = coordinator
        controller.presenter = presenter
        return controller
    }
    
    func createPhotoPickerController(coordinator: Coordinator) -> UIViewController? {
        let controller = PhotoPickerController()
        let presenter = PhotoPickerPresenter()
        presenter.coordinator = coordinator
        controller.presenter = presenter
        return controller
    }
}
