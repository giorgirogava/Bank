//
//  StackView+Extensions.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 07.01.22.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            NSLayoutConstraint.deactivate($0.constraints)
            $0.removeFromSuperview()
        }
    }
}
