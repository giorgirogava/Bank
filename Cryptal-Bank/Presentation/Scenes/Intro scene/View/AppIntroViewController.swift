//
//  AppIntroViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 16.12.21.
//

import UIKit

class AppIntroViewController: UIViewController {
    
    private var networkManager: NetworkManagerProtocol!
    private var exchangeManager: ExchangeDataManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager = NetworkManager()
        // DI - Dependenc injection
        exchangeManager = ExchangeDataManager(networkManager: networkManager)
        
        exchangeManager.getExchanges(){ rates in
            print(rates)
            print("ikakooo")
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
