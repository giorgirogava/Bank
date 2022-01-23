//
//  NationalCurrencyExchangeViewController.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 22.01.22.
//

import UIKit

class NationalCurrencyExchangeViewController: UIViewController {
    @IBOutlet weak var amount: FloatingLabelInput!
    @IBOutlet weak var dropDownFrom: DropDownView!
    @IBOutlet weak var dropDownTo: DropDownView!
    
    private var networkManager: NetworkManagerProtocol!
    private var currencyExchangeDataManager: CurrencyExchangeDataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager = NetworkManager()
        // DI - Dependenc injection
        currencyExchangeDataManager = CurrencyExchangeDataManager(networkManager: networkManager)
        
        currencyExchangeDataManager.getExchanges(amount: "100", from: "usd", to: "eur"){ rateTo in
            
            print(rateTo)
        }
        let currencies = ["USD","EUR","GBP","AED","AMD","AVD","AZN","BGN","CAD","CHF","CNY","CZK","DKK","ILS","JPY","NOK","PLN","QAR","RUR","SAR","SEK","TRY","UKG"]
        
        // The list of array to display. Can be changed dynamically
        dropDownFrom.optionArray = currencies
        dropDownTo.optionArray = currencies
        //Its Id Values and its optional
        //dropDownFrom.optionIds = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]

        // Image Array its optional
        //dropDownFrom.ImageArray = [👩🏻‍🦳,🙊,🥞]
        // The the Closure returns Selected Index and String
        dropDownFrom.didSelect{(selectedText , index ,id) in
        print("Selected String: \(selectedText) \n index: \(index)")
        }
    } // NationalCurrencyExchangeNavigationController

}
