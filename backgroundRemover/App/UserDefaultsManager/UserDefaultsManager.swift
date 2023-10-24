//
//  UserDefaultsManager.swift
//  backgroundRemover
//
//  Created by N S on 24.10.2023.
//

import Foundation

final class UserDefaultsManager {
    static var isOnboardingPassed: Bool {
        get {
            getValue(for: .isOnboardingPassed) ?? false
        }
        set {
            setValue(value: newValue, for: .isOnboardingPassed)
        }
    }
}

extension UserDefaultsManager {
    fileprivate static func setValue<T>(value: T, for key: UserDefaultsKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    fileprivate static func getValue<T>(for key: UserDefaultsKeys) -> T? {
        UserDefaults.standard.object(forKey: key.rawValue) as? T
    }
}
