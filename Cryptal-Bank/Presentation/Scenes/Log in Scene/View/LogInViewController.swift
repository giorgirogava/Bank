//
//  LogInViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 16.12.21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import LocalAuthentication

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var bEmailFild: FloatingLabelInput!
    @IBOutlet weak var bPasswordFild: FloatingLabelInput!
    
    let currentUser = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    func playerActiveStatus(isActive: Bool) {
        let appUserUid = Auth.auth().currentUser?.uid
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL ).reference(withPath:"Players/\(appUserUid ?? "error")/activeStatus")
        myNewRef.setValue(isActive)
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
        
        
        
        
        guard
            let email = bEmailFild.text,
            let password = bPasswordFild.text,
            !email.isEmpty,
            !password.isEmpty
        else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if let error = error, user == nil {
                let alert = UIAlertController(
                    title: "Sign In Failed",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true, completion: nil)
            }else {
                UDManager.markUserAsLoggedIn()
                self?.playerActiveStatus(isActive: true)
                
                self?.navigationController?.popToRootViewController( animated: false )
                let sb = UIStoryboard(name: "MainDashboardTabBarController", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "MainDashboardTabBarController")
                
                self?.navigationController?.viewControllers.removeAll()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func  viewDidAppear(_ animated: Bool){
        if currentUser != nil && UDManager.biometricAuthState(){
            tryBioAuth()
        }
    }
    
    func tryBioAuth(){
        
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
