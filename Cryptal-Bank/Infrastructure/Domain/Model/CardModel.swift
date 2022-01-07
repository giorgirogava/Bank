//
//  CardModel.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 07.01.22.
//

import Foundation

struct CardModel {
    var name:String?
    var owner:String?
    var colour:String?
    var expireData:String?
    var cardnumber:String?
    var AcountNumber:String?
    var balances:[CurrencyType]?
}
enum CurrencyType: String, CaseIterable {
    case EUR = "EUR"
    case GBP = "GBP"
    case USD = "USD"
    case GEL = "GEL"
    
    
}
