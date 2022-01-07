//
//  HomeDashboardViewModel.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 03.01.22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


protocol  HomeDashboardViewModelProtocol: AnyObject {
    func totalBalanceSingle(balance: @escaping (_ balance: String) -> ())
    func totalBalanceLive(balance: @escaping (_ balance: String) -> ())
    func balance(hide: Bool)
    func isHidenLive( hiden: @escaping (_ hiden: Bool) -> ())
    func isHidenSingle( hiden: @escaping (_ hiden: Bool) -> ())
    func getCards( card: @escaping (_ card: [CardModel]) -> ())
}

final class HomeDashboardViewModel: HomeDashboardViewModelProtocol {
    
    let appUserUid = Auth.auth().currentUser?.uid
    
    func totalBalanceSingle(balance: @escaping (_ balance: String) -> ()){
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersPrivateData/\(appUserUid)/totalBalance")
        
        // myNewRef.setValue("1387213838.234")
        
        myNewRef.observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists() {
                let value =   snapshot.value as? String ?? "0"
                
                balance(value)
            }else {
                balance("0")
            }
        })
        
    }
    
    func totalBalanceLive(balance: @escaping (_ balance: String) -> ()){
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersPrivateData/\(appUserUid)/totalBalance")
        
        // myNewRef.setValue("5.234")
        
        myNewRef.observe(.value) { snapshot in
            if snapshot.exists() {
                let value =   snapshot.value as? String ?? "0"
                
                balance(value)
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
                
                hiden(value)
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
                
                hiden(value)
            }else {
                hiden(false)
            }
        })
    }
    
    func getCards( card: @escaping (_ card: [CardModel]) -> ()){
        
        card([CardModel(name: "String?",
                        owner: "String",
                        colour: 0x0000ff,
                        expireData: "09/26",
                        cardnumber: "XXXXX XXXX XXXX 4262",
                        AcountNumber: "XXXX XXXXX 3434",
                        cardType: CardType.MASTER,
                        money: [Money(balances: 121232.23, Currency: CurrencyType.GEL),
                                Money(balances: 14352.23, Currency: CurrencyType.USD)]
                       ),
              CardModel(name: "String?",
                        owner: "String",
                        colour: 0x008000,
                        expireData: "09/26",
                        cardnumber: "XXXXX XXXX XXXX 6756",
                        AcountNumber: "XXXX XXXXX 3434",
                        cardType: CardType.MASTER,
                        money: [Money(balances: 121232.23, Currency: CurrencyType.GEL),
                                Money(balances: 14352.23, Currency: CurrencyType.USD)]
                       ),
              CardModel(name: "String?",
                        owner: "String",
                        colour: 0xff00ff,
                        expireData: "09/26",
                        cardnumber: "XXXXX XXXX XXXX XXXX",
                        AcountNumber: "XXXX XXXXX 3434",
                        cardType: CardType.VISA,
                        money: [Money(balances: 121232.23, Currency: CurrencyType.GEL),
                                Money(balances: 1432342352.23, Currency: CurrencyType.GBP),
                                Money(balances: 152.23, Currency: CurrencyType.EUR),
                                Money(balances: 14352.23, Currency: CurrencyType.USD)]
                       ),
              CardModel(name: "String?",
                              owner: "String",
                              colour: 0xff0000,
                              expireData: "09/26",
                              cardnumber: "XXXXX XXXX XXXX 2344",
                              AcountNumber: "XXXX XXXXX 3434",
                              cardType: CardType.VISA,
                              money: [Money(balances: 121232.23, Currency: CurrencyType.GEL),
                                      Money(balances: 45464566614352.23, Currency: CurrencyType.GBP),
                                      Money(balances: 14352.23, Currency: CurrencyType.USD)]
                             )
             ]
        )
    }
    
}
