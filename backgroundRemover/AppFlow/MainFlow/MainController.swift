//
//  MainController.swift
//  backgroundRemover
//
//  Created by N S on 24.10.2023.
//

import UIKit

final class MainController: UIViewController {
    
//MARK: - properties
    var presenter: MainPresenter?
    
    lazy var choosePhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitle("choose picture", for: .normal)
        button.addTarget(self, action: #selector(choosePicture), for: .touchUpInside)
        return button
    }()
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        view.addSubview(choosePhotoButton)
        
        choosePhotoButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
    
//MARK: - private funcs
    @objc private func choosePicture() {
        debugPrint("choose picture")
        presenter?.openPhotoPickerController()
    }
    
}
