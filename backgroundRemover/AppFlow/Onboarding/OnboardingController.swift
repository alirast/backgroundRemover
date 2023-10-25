//
//  OnboardingController.swift
//  backgroundRemover
//
//  Created by N S on 23.10.2023.
//

import SnapKit
import UIKit

final class OnboardingController: UIViewController {
    
//MARK: - Properties
    var presenter: OnboardingPresenter?
    
    private lazy var lightImageView: UIImageView = {
        let lightImageView = UIImageView()
        lightImageView.contentMode = .scaleAspectFill
        lightImageView.image = R.image.light()
        return lightImageView
    }()
    
    private lazy var textureImageView: UIImageView = {
        let textureImageView = UIImageView()
        textureImageView.contentMode = .scaleAspectFill
        textureImageView.image = R.image.texture()
        return textureImageView
    }()
    
    private lazy var onboardingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    private lazy var continueButton: UIButton = {
        let continueButton = UIButton()
        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 18)
        continueButton.layer.cornerRadius = 10
        continueButton.backgroundColor = .blueColor
        continueButton.layer.cornerCurve = .circular
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return continueButton
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .white.withAlphaComponent(0.3)
        pageControl.currentPageIndicatorTintColor = .blueColor
        pageControl.isUserInteractionEnabled = false
        pageControl.numberOfPages = 4
        return pageControl
    }()
    
    private var selectedCell = 0
    
    private let cells: [OnboardingCellTypes] = [.first, .second, .third, .fourth]

//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

//MARK: - Private funcs
    private func configureUI() {
        configureView()
        configureOnboardingCollectionView()
        addSubViews()
        setupConstraints()
    }
    
    private func configureView() {
        view.backgroundColor = .backgroundColor
    }
    
    private func addSubViews() {
        view.addSubview(lightImageView)
        view.addSubview(textureImageView)
        view.addSubview(continueButton)
        view.addSubview(pageControl)
        view.addSubview(onboardingCollectionView)
    }
    
    private func configureOnboardingCollectionView() {
        onboardingCollectionView.backgroundColor = .clear
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.isPagingEnabled = true
        onboardingCollectionView.register(classCell: OnboardingCell.self)
        onboardingCollectionView.isUserInteractionEnabled = true
    }
    
    private func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }
    
    @objc private func continueButtonTapped() {
        selectedCell += 1
        guard selectedCell < cells.count else {
            presenter?.onboardingEnded()
            return
        }
        onboardingCollectionView.scrollToItem(at: IndexPath(row: selectedCell, section: 0), at: .centeredHorizontally, animated: true)
    }

//MARK: - Constraints
    private func setupConstraints() {
        lightImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textureImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        onboardingCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(continueButton.snp.top).inset(-30)
        }
        
        continueButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(98)
            make.height.equalTo(60)
            make.bottom.equalTo(pageControl.snp.top).inset(-30)
        }
        
        pageControl.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(25)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset((UIScreen.main.bounds.height / 100) * 5)
        }
    }
}

//MARK: - Delegate & DataSource
extension OnboardingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.reusableCell(classCell: OnboardingCell.self, indexPath: indexPath)
        cell.configure(cellType: cells[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        pageControl.currentPage = Int(offset + horizontalCenter) / Int(width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        selectedCell = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = selectedCell
    }
}
