//
//  LogInViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 16.12.21.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
        
        navigationController?.popToRootViewController( animated: false )
        let sb = UIStoryboard(name: "MainDashboardTabBarController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainDashboardTabBarController")
        
        navigationController?.viewControllers.removeAll()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}
