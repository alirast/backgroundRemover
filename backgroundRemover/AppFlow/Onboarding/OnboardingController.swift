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
    
    private lazy var onboardingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = .blue
        nextButton.layer.cornerCurve = .circular
        return nextButton
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
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
        view.backgroundColor = .brown
    }
    
    private func addSubViews() {
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        view.addSubview(onboardingCollectionView)
    }
    
    private func configureOnboardingCollectionView() {
        onboardingCollectionView.backgroundColor = .white
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        //onboardingCollectionView.delegate = self
        //onboardingCollectionView.dataSource = self
        onboardingCollectionView.isPagingEnabled = true
    }
    
    private func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }

//MARK: - Constraints
    private func setupConstraints() {
        onboardingCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top)
        }
        
        nextButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(50)
            make.bottom.equalTo(pageControl.snp.top).inset(-10)
        }
        
        pageControl.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(25)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset((UIScreen.main.bounds.height / 100) * 5)
        }
    }
}
