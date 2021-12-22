//
//  UITableViewCell+Extension.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 20.12.21.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}

