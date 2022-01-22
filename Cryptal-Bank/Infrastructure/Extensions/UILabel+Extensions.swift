//
//  UILabel+Extensions.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 22.01.22.
//

import UIKit

extension UILabel {
    
    func setWithScaleAnimation(text: String){
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.transform = .init(scaleX: 1.25, y: 1.25)
        }) { (finished: Bool) -> Void in
            self.text = text
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                self.transform = .identity
            })
        }
    }
}
