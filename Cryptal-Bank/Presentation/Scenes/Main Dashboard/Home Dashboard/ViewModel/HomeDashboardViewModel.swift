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
    func saveCard( card: CardModel )
    func getCards( card: @escaping (_ card: [CardModel]) -> ())
    func getCardsSingle(fnCards: @escaping (_ card: [CardModel]) -> ())
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
                        money: [Money(balances: 121232.23, currency: CurrencyType.GEL),
                                Money(balances: 14352.23, currency: CurrencyType.USD)]
                       ),
              CardModel(name: "String?",
                        owner: "String",
                        colour: 0x008000,
                        expireData: "09/26",
                        cardnumber: "XXXXX XXXX XXXX 6756",
                        AcountNumber: "XXXX XXXXX 3434",
                        cardType: CardType.VISA,
                        money: [Money(balances: 121232.23, currency: CurrencyType.GEL),
                                Money(balances: 14352.23, currency: CurrencyType.USD)]
                       ),
              CardModel(name: "String?",
                        owner: "String",
                        colour: 0xff00ff,
                        expireData: "09/26",
                        cardnumber: "XXXXX XXXX XXXX XXXX",
                        AcountNumber: "XXXX XXXXX 3434",
                        cardType: CardType.VISA,
                        money: [Money(balances: 121232.23, currency: CurrencyType.GEL),
                                Money(balances: 1432342352.23, currency: CurrencyType.GBP),
                                Money(balances: 152.23, currency: CurrencyType.EUR),
                                Money(balances: 14352.23, currency: CurrencyType.USD)]
                       ),
              CardModel(name: "String?",
                              owner: "String",
                              colour: 0xff0000,
                              expireData: "09/26",
                              cardnumber: "XXXXX XXXX XXXX 2344",
                              AcountNumber: "XXXX XXXXX 3434",
                              cardType: CardType.VISA,
                              money: [Money(balances: 121232.23, currency: CurrencyType.GEL),
                                      Money(balances: 454566614352.23, currency: CurrencyType.GBP),
                                      Money(balances: 14352.23, currency: CurrencyType.USD)]
                             )
             ]
        )
    }
    
    
    func getCardsSingle(fnCards: @escaping (_ card: [CardModel]) -> ()){
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersPrivateData/\(appUserUid)/Cards")

        
        myNewRef.observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists() {
                let value =   snapshot.value as? NSDictionary
                var cards:[CardModel] = []
                value?.forEach{ cd in
                    //print(cd.value)
                    let card = cd.value as? NSDictionary
                    
                    let name = card?["name"] as? String ?? ""
                    let owner = card?["owner"] as? String ?? ""
                    let colour = card?["colour"] as? Int ?? 0xff0000
                    let expireData = card?["expireData"] as? String ?? ""
                    let cardnumber = card?["cardnumber"] as? String ?? ""
                    let AcountNumber = card?["AcountNumber"] as? String ?? ""
                    let cardType = card?["cardType"] as? CardType ?? CardType.VISA
                    let money = card?["money"] as? NSArray
                    
                    
                    var moneyes:[Money] = []
                    
                    money?.forEach{ m in
                        //print(m)
                        let mon = m as? NSDictionary
                        let balances = mon?["balances"] as? Double ?? 0.0
                        let currency = mon?["currency"] as? String ?? CurrencyType.GEL
                        
                        moneyes.append(Money(balances: balances, currency: currency))
                        
                    }
                    cards.append(CardModel(name: name,
                                           owner: owner,
                                           colour: colour,
                                           expireData: expireData,
                                           cardnumber: cardnumber,
                                           AcountNumber: AcountNumber,
                                           cardType: cardType,
                                           money: moneyes
                                          ))
                }

                fnCards(cards)
            }else {
                fnCards([])
            }
        })
        
    }
    
    func saveCard(card: CardModel){
        guard let appUserUid = self.appUserUid else { return}
        guard let cardNumber = card.cardnumber else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersPrivateData/\(appUserUid)/Cards/\(cardNumber)")
        
         myNewRef.setValue(card.toNSDictionary())
//         myNewRef.setValue( CardModel(name: "String?",
//                                      owner: "String",
//                                      colour: 0xff00ff,
//                                      expireData: "09/26",
//                                      cardnumber: "53453 XXXX XXXX 2344",
//                                      AcountNumber: "XXXX XXXXX 3434",
//                                      cardType: CardType.VISA,
//                                      money: [Money(balances: 121232.23, currency: CurrencyType.GEL),
//                                              Money(balances: 454566614352.23, currency: CurrencyType.GBP),
//                                              Money(balances: 14352.23, currency: CurrencyType.USD)]
//                                     ).toNSDictionary())
    }
    
}
