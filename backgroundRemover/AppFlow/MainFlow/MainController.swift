//
//  MainController.swift
//  backgroundRemover
//
//  Created by N S on 24.10.2023.
//

import UIKit
import Photos
import PhotosUI

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
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
}

//MARK: - delegates
extension MainController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let key = UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")
        if let image = info[key] as? UIImage {
            picker.dismiss(animated: true)
            presenter?.openMediaController(image: image)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
