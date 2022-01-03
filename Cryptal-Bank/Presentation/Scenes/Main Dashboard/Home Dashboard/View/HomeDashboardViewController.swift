//
//  HomeDashboardViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 03.01.22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeDashboardViewController: UIViewController {
    @IBOutlet weak private var ballanceLabel: UILabel!
    @IBOutlet weak private var currencyLabel: UILabel!
    @IBOutlet weak private var eyeButton: UIButton!
    
    private var viewModel: HomeDashboardViewModelProtocol!
    private var dataService: CreateAccountDataService!
    
    let appUserUid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isHidenLive(){ [unowned self] hiden in
            if hiden {
                self.eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                ballanceLabel.text = "$ $ $ $"
                currencyLabel.isHidden = true
            }else {
                self.eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
                
                totalBalanceSingle(){[unowned self] balance in
                    ballanceLabel.text = balance.moneyFormat()
                }
                currencyLabel.isHidden = false
            }
        }
        
        totalBalanceLive(){[unowned self] balance in
            
            ballanceLabel.text = balance
        }
        
        configureDataSource()
    }
    
    private func configureDataSource() {
        // HomeDashboardViewModel
        
    }
    @IBAction func onEyeButtonClick(_ sender: UIButton) {
        //        sender.setImage(UIImage(systemName: "eye"), for: .normal)
        
        isHidenSingle(){ [unowned self] isHiden in
            var hiden = isHiden
            hiden.toggle()
            balance(hide: hiden)
        }
    }
    
    
    func totalBalanceSingle(balance: @escaping (_ balance: String) -> ()){
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersPrivateData/\(appUserUid)/totalBalance")
        
        // myNewRef.setValue("1387213838.234")
        
        myNewRef.observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists() {
                let value =   snapshot.value as? String ?? "0"
                
                return balance(value)
            }else {
                balance("0")
            }
        })
        
    }
    
    func totalBalanceLive(balance: @escaping (_ balance: String) -> ()){
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersPrivateData/\(appUserUid)/totalBalance")
        
        // myNewRef.setValue("1387213838.234")
        
        myNewRef.observe(.value) { snapshot in
            if snapshot.exists() {
                let value =   snapshot.value as? String ?? "0"
                
                return balance(value)
            }else {
                balance("0")
            }
        }
        
    }
    
    
    
    func balance(hide: Bool){
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersConfigs/\(appUserUid)/balanceIsHiden")
        
        myNewRef.setValue( hide )
    }
    
    
    
    func isHidenLive( hiden: @escaping (_ hiden: Bool) -> ()){
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersConfigs/\(appUserUid)/balanceIsHiden")
        
        myNewRef.observe(.value) { snapshot in
            if snapshot.exists() {
                let value =   snapshot.value as? Bool ?? false
                
                return hiden(value)
            }else {
                hiden(false)
            }
        }
    }
    func isHidenSingle( hiden: @escaping (_ hiden: Bool) -> ()){
        guard let appUserUid = Auth.auth().currentUser?.uid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersConfigs/\(appUserUid)/balanceIsHiden")
        
        myNewRef.observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists() {
                let value =   snapshot.value as? Bool ?? false
                
                return hiden(value)
            }else {
                hiden(false)
            }
        })
    }
    
}


extension String {
    func moneyFormat() -> String{
        var newString = ""
         Array(self).enumerated().forEach{ index, char  in
            
            if (index + 1) % 3 == 0 {
                newString += " "
            }
             newString += "\(char)"
        }
        return newString
    }
}
