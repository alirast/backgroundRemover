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
    
    private let upperShadowGradientLayer = CAGradientLayer()
    private let bottomShadowGradientLayer = CAGradientLayer()
    
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        upperShadowGradientLayer.frame.size.height = bounds.height / 2
        upperShadowGradientLayer.frame.size.width = bounds.width
        
        bottomShadowGradientLayer.frame = CGRect(x: 0, y: (bounds.height / 2), width: bounds.width, height: (bounds.height / 2))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(cellType: OnboardingCellTypes) {
        cellImageView.image = cellType.getCellImage()
        titleLabel.text = cellType.getTitle()
        descriptionLabel.text = cellType.getDescription()
        if cellType == .fourth {
            configureShadowGradientLayers()
        }
        addLabelsOverShadowLayers()
        if cellType == .fourth {
            setupSpecialColorTextDescription()
            updateConstraintsFour()
        }
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
    
    private func configureShadowGradientLayers() {
        upperShadowGradientLayer.colors = [UIColor.backgroundColor.cgColor, UIColor.clear.cgColor]
        upperShadowGradientLayer.startPoint = CGPoint(x: 0, y: 0.25)
        upperShadowGradientLayer.endPoint = CGPoint(x: 0, y: 1)
        layer.addSublayer(upperShadowGradientLayer)
        
        bottomShadowGradientLayer.colors = [UIColor.clear.cgColor, UIColor.backgroundColor.cgColor]
        bottomShadowGradientLayer.startPoint = CGPoint(x: 0, y: 0)
        bottomShadowGradientLayer.endPoint = CGPoint(x: 0, y: 0.75)
        layer.addSublayer(bottomShadowGradientLayer)
    }
    
    private func configureTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: 20)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.font = UIFont(name: "Gilroy-Regular", size: 18)
        descriptionLabel.textColor = .grayColor1
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
    }
    
    private func addSubViews() {
        addSubview(cellImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func addLabelsOverShadowLayers() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func setupSpecialColorTextDescription() {
        guard let labelText = descriptionLabel.text else { return }
        let attributedString = NSMutableAttributedString(string: labelText)
        
        let commaRange = (labelText as NSString).range(of: ",")
        attributedString.addAttribute(.foregroundColor, value: UIColor.grayColor1, range: NSRange(location: commaRange.location + 1, length: labelText.count - commaRange.location - 1))
        
        //first part of the text and first comma
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: commaRange.location + 1))

        descriptionLabel.attributedText = attributedString
    }

//MARK: - Constraints
    private func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(110)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo((UIScreen.main.bounds.height / 100) * 45)
        }
        
        titleLabel.snp.makeConstraints { make in
            if UIScreen.main.bounds.height < 700 {
                make.top.equalTo(cellImageView.snp.bottom).inset(-(UIScreen.main.bounds.height / 100) * 3)
            } else {
                make.top.equalTo(cellImageView.snp.bottom).inset(-35)
            }
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            if UIScreen.main.bounds.height < 700 {
                make.top.equalTo(titleLabel.snp.bottom).inset((UIScreen.main.bounds.height / 100) * 2)
            } else {
                make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            }
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
    }
    
    private func updateConstraintsFour() {
        titleLabel.snp.updateConstraints { make in
            if UIScreen.main.bounds.height < 700 {
                make.leading.trailing.equalToSuperview().inset(50)
            } else {
                make.leading.trailing.equalToSuperview().inset(90)
            }
        }
        
        descriptionLabel.snp.updateConstraints { make in
            if UIScreen.main.bounds.height < 700 {
                make.leading.trailing.equalToSuperview().inset(50)
                make.top.equalTo(titleLabel.snp.bottom).inset(-(UIScreen.main.bounds.height / 100) * 1.5)
            } else {
                make.leading.trailing.equalToSuperview().inset(100)
            }
        }
    }
}
