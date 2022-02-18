//
//  CryptoWalletModel.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 18.02.22.
//

import Foundation

struct CryptoWalletModel {
    var cryptoIcon: String?
    var cryptoShortName: String?
    var cryptoLongName: String?
    var balanceInCrypto: Double?
    
    func toNSDictionary()-> NSDictionary {
        ["cryptoIcon": cryptoIcon ?? "",
         "cryptoShortName": cryptoShortName ?? "",
         "cryptoLongName": cryptoLongName ?? "",
         "balanceInCrypto": balanceInCrypto ?? ""
        ]
    }
}
