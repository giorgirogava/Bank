//
//  ExchangeDataManager.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 22.12.21.
//

import Foundation


class ExchangeDataManager {
    
    private var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getExchanges( completion: @escaping ((Crypto) -> Void)) {
        let queries = ["apikey": ExchangeRatesConstants.API_KEY]
        
        networkManager.get(url: ExchangeRatesConstants.BASE_URL_EXCHANGE, path: ExchangeRatesConstants.EXCHANGE_URL_PATH, HTTPHeaderFields: [:] , queryParams: queries) { (result: Result<Crypto, Error>) in
            switch result {
            case .success(let apiResponse):
                completion(apiResponse)
            case .failure(let error):
                print("\(error) ikakooooooooo")
            }
        }
    }
}
