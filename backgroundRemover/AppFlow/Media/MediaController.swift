//
//  MediaController.swift
//  backgroundRemover
//
//  Created by N S on 25.10.2023.
//

import UIKit

final class MediaController: UIViewController {
    
//MARK: - properties
    var presenter: MediaPresenter?
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
//MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
//MARK: - private funcs
    private func configureUI() {
        configureView()
        setupConstraints()
    }
    
    private func configureView() {
        view.backgroundColor = .brown
        view.addSubview(image)
    }
    
    private func setupConstraints() {
        image.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.height.equalTo(300)
        }
    }
}
