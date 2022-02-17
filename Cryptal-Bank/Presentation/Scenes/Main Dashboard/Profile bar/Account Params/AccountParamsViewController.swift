//
//  AccountParamsViewController.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 17.02.22.
//

import UIKit
import LocalAuthentication

class AccountParamsViewController: UIViewController {
    @IBOutlet weak var bASwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UDManager.biometricAuthState() {
            bASwitch.toggleState()
        }
    }
    @IBAction func bAButton(_ sender: Any) {
        bASwitch.toggleState()
        trunOnOrTurnOFFAuth()
    }
    
    @IBAction func bASwitchTurn(_ sender: UISwitch) {
        trunOnOrTurnOFFAuth()
    }
    
    func trunOnOrTurnOFFAuth(){
        if UDManager.biometricAuthState() {
            UDManager.biometricAuthState(isOn: false)
        }else {
            tryBioAuth(){ [weak self] successfull in
                if successfull {
                    UDManager.biometricAuthState(isOn: true)
                }else {
                    self?.bASwitch.toggleState()
                }
            }
        }
    }
    
    func tryBioAuth(end: @escaping (_ successfull: Bool) -> ()){
        
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
                        end(false)
                        return
                    }
                    
                    end(true)
                    
                }
                
            }
            
        } else {
            
            let alert = UIAlertController(title: "Unavailable",
                                          message: "You cant use this feature",
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            
            present(alert, animated: true)
            end(false)
        }
        
    }
}
