//
//  BiometricsViewController.swift
//  Cryptal-Bank
//
//  Created by IMAC on 30.12.21.
//

import LocalAuthentication
import UIKit

class BiometricsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Authorize", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
    }
    
    
    @objc func didTapButton(){
        
        let context = LAContext()
        var error: NSError? = nil
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                     error: &error) {
            
            let reason = "Please authorize with touch id! "
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   
                                   localizedReason: reason)  { [weak self] success, error in
                
                
                DispatchQueue.main.async {
                    
                    guard success, error == nil else {
                        
                        let alert = UIAlertController(title: "Failed to Authenticate",
                                                      message: "Please try again",
                                                      preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                        
                        self?.present(alert, animated: true)
                        
                        return
                    }
                    
                    self?.navigationController?.popToRootViewController( animated: false )
                    let sb = UIStoryboard(name: "MainDashboardTabBarController", bundle: nil)
                    let vc = sb.instantiateViewController(withIdentifier: "MainDashboardTabBarController")
                    
                    self?.navigationController?.viewControllers.removeAll()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                    
                }
                
            }
            
        } else {
            
            let alert = UIAlertController(title: "Unavailable",
                                          message: "You cant use this feature",
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            
            present(alert, animated: true)
            
        }
        
    }
    
    
    
}

