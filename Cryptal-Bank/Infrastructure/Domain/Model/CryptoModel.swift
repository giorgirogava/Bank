//
//  CryptoModel.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 22.12.21.
//

import Foundation

// MARK: - CryptoElement
struct CryptoElement: Codable {
    let assetID, name: String?
    let typeIsCrypto: Int?
    let dataQuoteStart, dataQuoteEnd, dataTradeStart, dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double?
    let dataStart, dataEnd: String?
    let priceUsd: Double?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case typeIsCrypto = "type_is_crypto"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case priceUsd = "price_usd"
    }
}

typealias Crypto = [CryptoElement]

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cryptoModel = try? newJSONDecoder().decode(CryptoModel.self, from: jsonData)

import Foundation

// MARK: - CryptoModelElement
struct CryptoModelElement: Codable {
    var id, symbol, name: String?
    var image: String?
    var currentPrice: Double?
    var marketCap, marketCapRank: Int?
    var fullyDilutedValuation: Int?
    var totalVolume: Int?
    var high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    var marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double?
    var totalSupply, maxSupply: Double?
    var ath, athChangePercentage: Double?
    var athDate: String?
    var atl, atlChangePercentage: Double?
    var atlDate: String?
    var roi: Roi?
    var lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case roi
        case lastUpdated = "last_updated"
    }
}

// MARK: - Roi
struct Roi: Codable {
    var times: Double?
    var currency: Currency?
    var percentage: Double?
}

enum Currency: String, Codable {
    case btc = "btc"
    case eth = "eth"
    case usd = "usd"
}

typealias CryptoModel = [CryptoModelElement]
