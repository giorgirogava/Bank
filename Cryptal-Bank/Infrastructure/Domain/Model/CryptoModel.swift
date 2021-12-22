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
