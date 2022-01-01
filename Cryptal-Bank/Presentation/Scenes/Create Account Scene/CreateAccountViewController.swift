//
//  CreateAccountViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 16.12.21.
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginClick(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }

}
