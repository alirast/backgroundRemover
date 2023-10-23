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
            return UIImage()
        case .second:
            return UIImage()
        case .third:
            return UIImage()
        case .fourth:
            return UIImage()
        }
    }
    
    func getTitle() -> String? {
        switch self {
        case .first:
            return "first"
        case .second:
            return "second"
        case .third:
            return "third"
        case .fourth:
            return "fourth"
        }
    }
    
    func getDescription() -> String? {
        switch self {
        case .first:
            return "first description"
        case .second:
            return "second description"
        case .third:
            return "third description"
        case .fourth:
            return "fourth description"
        }
    }
}
