//
//  ViewController+Extensions.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 21.01.22.
//

import UIKit

extension AddCardViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}
