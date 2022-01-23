//
//  CryptoDataManager.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 22.01.22.
//

import Foundation

class CryptoDataManager {
    private var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getCrypto( completion: @escaping ((CryptoModel) -> Void)){
        let queries = ["vs_currency": "usd",
                       "pages":"1",
                       "per_page":"50",
                       "order":"market_cap_desc"]
        
        networkManager.get(url: CryptoConstants.BASE_URL_CRYPTO, path: CryptoConstants.CRYPTO_URL_PATH, HTTPHeaderFields: [:] , queryParams: queries) { (result: Result<CryptoModel, Error>) in
            switch result {
            case .success(let apiResponse):
                completion(apiResponse)
            case .failure(let error):
                print("\(error) ikakooooooooo")
            }
        }
    }
}
