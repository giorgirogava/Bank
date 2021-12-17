//
//  Models.swift
//  Cryptal-Bank
//
//  Created by IMAC on 16.12.21.
//

import Foundation

struct Crypto: Codable {
    
    let asset_id: String
    let name: String?
    let price_usd: Float?
    let id_icon: String?
    
}


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
