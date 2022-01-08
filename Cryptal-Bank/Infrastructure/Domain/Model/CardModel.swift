//
//  CardModel.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 07.01.22.
//

import Foundation

struct CardModel {
    var name: String?
    var owner: String?
    var colour: Int?
    var expireData: String?
    var cardnumber: String?
    var AcountNumber: String?
    var cardType: CardType?
    var money: [Money]?
    
    
    func toNSDictionary()-> NSDictionary {
        ["name": name ?? "",
         "owner": owner ?? "",
         "colour": colour ?? 0x008000,
         "expireData": expireData ?? "",
         "cardnumber": cardnumber ?? "",
         "AcountNumber": AcountNumber ?? "",
         "cardType": cardType?.rawValue ?? "",
         "money": money?.compactMap{
            ["balances": $0.balances ?? 0.0,
             "currency": $0.currency?.rawValue ?? ""]
           } ?? []
        ]
    }
}
struct Money {
    var balances: Double?
    var currency: CurrencyType?
}


enum CurrencyType: String, CaseIterable {
    case EUR = "EUR"
    case GBP = "GBP"
    case USD = "USD"
    case GEL = "GEL"
}

enum CardType:String,CaseIterable {
    case VISA = "VISA"
    case MASTER = "MASTER"
}
