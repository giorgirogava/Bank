//
//  Models.swift
//  Cryptal-Bank
//
//  Created by IMAC on 16.12.21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let crypto = try? newJSONDecoder().decode(Crypto.self, from: jsonData)

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

//    "asset_id": "USD",
//    "name": "USD",
//    "type_is_crypto": 1,
//    "data_quote_start": "2021-11-04T14:00:00.0000000Z",
//    "data_quote_end": "2021-12-16T16:47:17.3560000Z",
//    "data_trade_start": "2021-11-04T16:34:29.1703990Z",
//    "data_trade_end": "2021-12-16T16:47:42.9610000Z",
//    "data_symbols_count": 196,
//    "volume_1hrs_usd": 175546777.42,
//    "volume_1day_usd": 3817969478.04,
//    "volume_1mth_usd": 157709864124.52,
//    "data_start": "2021-11-04",
//    "data_end": "2021-12-16"
