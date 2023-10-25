//
//  MainPresenter.swift
//  backgroundRemover
//
//  Created by N S on 24.10.2023.
//

import UIKit

final class MainPresenter {
    var coordinator: Coordinator?
    
    func openMediaController(image: UIImage) {
        coordinator?.routeToMediaController(image)
    }
}
