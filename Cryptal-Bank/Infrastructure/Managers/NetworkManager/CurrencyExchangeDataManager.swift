//
//  CurrencyExchangeDataManager.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 23.01.22.
//

import Foundation

class CurrencyExchangeDataManager{
    private var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getExchanges(amount:String, from:String, to:String, completion: @escaping ((ExchangeFromToModel) -> Void)) {
        let queries = ["amount":amount,
                       "from":from,
                       "to":to]
        let headers = [//"application/json":"Content-Type",
                      // "application/json":"Accept",
                       "apikey": ExchangeRatesConstants.TBC_API_KEY]
        
        networkManager.get(url: ExchangeRatesConstants.TBC_BASE_URL_EXCHANGE, path: ExchangeRatesConstants.TBC_EXCHANGE_URL_PATH, HTTPHeaderFields: headers , queryParams: queries) { (result: Result<ExchangeFromToModel, Error>) in
            switch result {
            case .success(let apiResponse):
                completion(apiResponse)
            case .failure(let error):
                print("\(error) ikakooooooooo")
            }
        }
    }
    
    func getAllNationalCurrencies(completion: @escaping ((AllNationalCurrenciesModel) -> Void)){
        let headers = ["apikey": ExchangeRatesConstants.TBC_API_KEY]
        
        networkManager.get(url: ExchangeRatesConstants.TBC_BASE_URL_EXCHANGE, path: ExchangeRatesConstants.TBC_AllRATES_URL_PATH, HTTPHeaderFields: headers , queryParams: [:]) { (result: Result<AllNationalCurrenciesModel, Error>) in
            switch result {
            case .success(let apiResponse):
                completion(apiResponse)
            case .failure(let error):
                print("\(error) ikakooooooooo")
            }
        }
    }
    
    
}
