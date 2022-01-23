//
//  NationalCurrencyExchangeViewController.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 22.01.22.
//

import UIKit

class NationalCurrencyExchangeViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
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
        
      
        let currencies = ["GEL","USD","EUR","GBP","AED","AMD","AVD","AZN","BGN","CAD","CHF","CNY","CZK","DKK","ILS","JPY","NOK","PLN","QAR","RUR","SAR","SEK","TRY","UKG"]
        
       
        dropDownFrom.optionArray = currencies
        dropDownTo.optionArray = currencies

        dropDownFrom.listDidDisappear() { [weak self] in
            self?.updateResultOfexchange()
        }
        dropDownTo.listDidDisappear() { [weak self] in
            self?.updateResultOfexchange()
        }
    }
    
    @IBAction func invertCurrencies(_ sender: Any) {
        if let dropDownFromtext = dropDownFrom.text,
           let dropDownTotext = dropDownTo.text
        {
            dropDownFrom.text = dropDownTotext
            dropDownTo.text = dropDownFromtext
        }
        updateResultOfexchange()
    }
    
    @IBAction func onAmountChange(_ sender: Any) {
        updateResultOfexchange()
    }
    
    
    func updateResultOfexchange(){
        currencyExchangeDataManager.getExchanges(amount: amount.text ?? "", from: dropDownFrom.text ?? "", to: dropDownTo.text ?? ""){ [weak self] rateTo in
            
            DispatchQueue.main.async {
                if let value = rateTo.value,
                   let amount = self?.amount.text,
                   let dropDownFromtext = self?.dropDownFrom.text,
                   let dropDownTotext = self?.dropDownTo.text
                {
                 self?.resultLabel.text = "\(amount) \(dropDownFromtext) = \(value) \(dropDownTotext)"
                }else {
                        self?.resultLabel.text = ""
                }
            }
        }
    }
}
