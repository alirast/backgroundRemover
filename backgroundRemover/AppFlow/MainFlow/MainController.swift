//
//  MainController.swift
//  backgroundRemover
//
//  Created by N S on 24.10.2023.
//

import UIKit

final class MainController: UIViewController {
    var presenter: MainPresenter?

//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
}
