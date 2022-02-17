//
//  ProfileTabViewController.swift
//  MidTerm_Movies
//
//  Created by MacBook Pro on 26.10.21.
//

import UIKit
import FirebaseAuth

class ProfileTabViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view. ProfileNavigationController UINavigationController
    }
    
    @IBAction private func onLogOutButtonClick(_ sender: Any) {
        UDManager.markUserAsLoggedOut()
        UDManager.biometricAuthState(isOn: false)
        do { try Auth.auth().signOut() }
        catch { print("already logged out") }
        
        self.navigationController?.popToRootViewController( animated: false )
        let sb = UIStoryboard(name: "AppIntroViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AppIntroViewController")
        
        self.navigationController?.viewControllers.removeAll()
        vc.modalPresentationStyle = .fullScreen
        let window : UIWindow? = UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        window?.rootViewController = UINavigationController(rootViewController: vc)

    }
}
