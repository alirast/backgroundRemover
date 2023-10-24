//
//  CollectionView.swift
//  backgroundRemover
//
//  Created by N S on 24.10.2023.
//

import UIKit

extension NSObject {
    class var className: String {
        let array = String(describing: self).components(separatedBy: ".")
        return array.last ?? "className"
    }
}

extension UICollectionView {
    func register<T>(classCell: T.Type) where T: UICollectionViewCell {
        self.register(classCell, forCellWithReuseIdentifier: classCell.className)
    }
    
    func reusableCell<T>(classCell: T.Type, indexPath: IndexPath) -> T where T: UICollectionViewCell {
        if let newCell = self.dequeueReusableCell(withReuseIdentifier: classCell.className, for: indexPath) as? T {
            return newCell
        }
        return T()
    }
}
