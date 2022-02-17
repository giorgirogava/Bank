//
//  UISwitch+Extensions.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 17.02.22.
//

import UIKit

extension UISwitch {
    func toggleState(){
        if self.isOn {
            self.setOn(false, animated: true)
        }else{
            self.setOn(true, animated: true)
        }
    }
}
