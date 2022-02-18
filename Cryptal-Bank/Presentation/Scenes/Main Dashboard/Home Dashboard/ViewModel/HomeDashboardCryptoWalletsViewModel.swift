//
//  HomeDashboardCryptoWalletsViewModelProtocol.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 18.02.22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol HomeDashboardCryptoWalletsViewModelProtocol: AnyObject {
    func saveCryptoWallet()
    func getCryptoWalletsSingle(fnCards: @escaping (_ card: [CryptoWalletModel]) -> ())
}

class HomeDashboardCryptoWalletsViewModel: HomeDashboardCryptoWalletsViewModelProtocol {
    let appUserUid = Auth.auth().currentUser?.uid
    
    
    
    func saveCryptoWallet(){
        
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersPrivateData/\(appUserUid)/CryptoWallets/\("hbdsashdhbsade723ehdffqwe2yhe2eh")")
        
        myNewRef.setValue(CryptoWalletModel(cryptoIcon: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                                            cryptoShortName: "BTC",
                                            cryptoLongName: "Bitcoin",
                                            balanceInCrypto: 0.0223).toNSDictionary())
    }
    
    
    func getCryptoWalletsSingle(fnCards: @escaping (_ card: [CryptoWalletModel]) -> ()){
        guard let appUserUid = self.appUserUid else { return}
        
        let myNewRef = Database.database(url: Servers.Firebase_Base_URL).reference(withPath:"UsersPrivateData/\(appUserUid)/CryptoWallets")

        
        myNewRef.observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists() {
                let value =   snapshot.value as? NSDictionary
                var wallets: [CryptoWalletModel] = []
                value?.forEach{ cd in
                    //print(cd.value)
                    let wallet = cd.value as? NSDictionary
                    
                    let cryptoIcon = wallet?["cryptoIcon"] as? String ?? ""
                    let cryptoShortName = wallet?["cryptoShortName"] as? String ?? ""
                    let cryptoLongName = wallet?["cryptoLongName"] as? String ?? ""
                    let balanceInCrypto = wallet?["balanceInCrypto"] as? Double ?? 0.0
                    
                    wallets.append(CryptoWalletModel(cryptoIcon: cryptoIcon, cryptoShortName: cryptoShortName, cryptoLongName: cryptoLongName, balanceInCrypto: balanceInCrypto))
                }

                fnCards(wallets)
            }else {
                fnCards([])
            }
        })
        
    }
    
    
}
