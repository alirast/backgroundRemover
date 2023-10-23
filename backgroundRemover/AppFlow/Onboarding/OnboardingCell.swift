//
//  OnboardingCell.swift
//  backgroundRemover
//
//  Created by N S on 23.10.2023.
//

import UIKit

final class OnboardingCell: UICollectionViewCell {

//MARK: - Properties
    static let identifier = String(describing: OnboardingCell.self)
    private let cellImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Private funcs
    private func configureUI() {
        configureView()
        configureCellImageView()
        configureTitleLabel()
        configureDescriptionLabel()
        addSubViews()
        setupConstraints()
    }
    
    private func configureView() {
        backgroundColor = .clear
        clipsToBounds = true
    }
    
    private func configureCellImageView() {
        cellImageView.contentMode = .scaleAspectFill
    }
    
    private func configureTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
    }
    
    private func addSubViews() {
        addSubview(cellImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }

//MARK: - Constraints
    private func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo((UIScreen.main.bounds.height / 100) * 63)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImageView.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-4)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
    
}
