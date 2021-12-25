//
//  LogInViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 16.12.21.
//

import UIKit
import SpriteKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
        
        navigationController?.popToRootViewController( animated: false )
        let sb = UIStoryboard(name: "MainDashboardTabBarController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainDashboardTabBarController")
        
        navigationController?.viewControllers.removeAll()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
