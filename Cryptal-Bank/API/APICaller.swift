//
//  APICaller.swift
//  Cryptal-Bank
//
//  Created by IMAC on 16.12.21.
//

// https://rest-sandbox.coinapi.io/v1/assets/?apikey=6335B683-5E47-458D-A4CB-5C1FBC5CE31E

// https://rest-sandbox.coinapi.io/v1/assets/icons/50/?apikey=6335B683-5E47-458D-A4CB-5C1FBC5CE31E



import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey  = "6335B683-5E47-458D-A4CB-5C1FBC5CE31E"
        static let assetsEndpoint = "https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init() {}
    
    
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void){
        
        
        guard let url = URL(string: Constants.assetsEndpoint + "?apikey=" + Constants.apiKey) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                
                
                completion(.success(cryptos))
                
            }
            catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    
    public func getAllIcons(){
        guard let url = URL(string: "https://rest-sandbox.coinapi.io/v1/assets/icons/50/?apikey=6335B683-5E47-458D-A4CB-5C1FBC5CE31E")
                
        else {
            return
        }
    }
    
}


