//
//  OnboardingPresenter.swift
//  backgroundRemover
//
//  Created by N S on 23.10.2023.
//

import Foundation

final class OnboardingPresenter {
    var coordinator: Coordinator?
    
    func onboardingEnded() {
        debugPrint("onboarding ended")
        UserDefaultsManager.isOnboardingPassed = true
        closeOnboardingController()
    }
    
    private func closeOnboardingController() {
        debugPrint("close onboarding controller")
        coordinator?.switchToMainController()
    }
}
