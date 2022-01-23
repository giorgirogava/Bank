//
//  ExchangeFromToModel.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 23.01.22.
//

import Foundation

// MARK: - ExchangeFromToModel
struct ExchangeFromToModel: Codable {
    var from, to: String?
    var amount: Int?
    var value: Double?
    var type: String?
    var title: String?
    var status: Int?
    var detail, systemCode, code: String?
}
