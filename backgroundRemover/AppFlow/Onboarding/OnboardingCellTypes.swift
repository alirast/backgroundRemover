//
//  OnboardingCellTypes.swift
//  backgroundRemover
//
//  Created by N S on 23.10.2023.
//

import UIKit

enum OnboardingCellTypes {
    case first, second, third, fourth
    
    func getCellImage() -> UIImage? {
        switch self {
        case .first:
            return R.image.firstCellImage()
        case .second:
            return R.image.secondCellImage()
        case .third:
            return R.image.thirdCellImage()
        case .fourth:
            return R.image.fourthCellImage()
        }
    }
    
    func getTitle() -> String? {
        switch self {
        case .first:
            return R.string.localizable.onboardingControllerFirstCellTitle()
        case .second:
            return R.string.localizable.onboardingControllerSecondCellTitle()
        case .third:
            return R.string.localizable.onboardingControllerThirdCellTitle()
        case .fourth:
            return R.string.localizable.onboardingControllerFourthCellTitle()
        }
    }
    
    func getDescription() -> String? {
        switch self {
        case .first:
            return R.string.localizable.onboardingControllerFirstCellDescription()
        case .second:
            return R.string.localizable.onboardingControllerSecondCellDescription()
        case .third:
            return R.string.localizable.onboardingControllerThirdCellDescription()
        case .fourth:
            return R.string.localizable.onboardingControllerFourthCellDescription()
        }
    }
}
