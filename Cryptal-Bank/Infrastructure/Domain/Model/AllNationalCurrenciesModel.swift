//
//  AllNationalCurrenciesModel.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 23.01.22.
//

import Foundation

// MARK: - AllNationalCurrenciesModel
struct AllNationalCurrenciesModel: Codable {
    var base: String?
    var commercialRatesList: [CommercialRatesList]?
}

// MARK: - CommercialRatesList
struct CommercialRatesList: Codable {
    var currency: String?
    var buy, sell: Double?
}
