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
        
        
        // The list of array to display. Can be changed dynamically
        dropDownFrom.optionArray = ["Option 1", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3"]
        dropDownTo.optionArray = ["Option 1", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3", "Option 2", "Option 3"]
        //Its Id Values and its optional
        dropDownFrom.optionIds = [1,23,54,22]

        // Image Array its optional
        //dropDownFrom.ImageArray = [👩🏻‍🦳,🙊,🥞]
        // The the Closure returns Selected Index and String
        dropDownFrom.didSelect{(selectedText , index ,id) in
        print("Selected String: \(selectedText) \n index: \(index)")
        }
    } // NationalCurrencyExchangeNavigationController

}
