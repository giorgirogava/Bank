//
//  UICollectionViewCell+Extension.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 20.12.21.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: identifier, bundle: nil) }
}
