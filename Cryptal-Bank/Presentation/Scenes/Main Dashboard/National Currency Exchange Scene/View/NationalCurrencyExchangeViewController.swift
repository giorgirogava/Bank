//
//  NationalCurrencyExchangeViewController.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 22.01.22.
//

import UIKit

class NationalCurrencyExchangeViewController: UIViewController {
    @IBOutlet weak private var scrolableContent: UIScrollView!
    @IBOutlet weak private var resultLabel: UILabel!
    @IBOutlet weak private var amount: FloatingLabelInput!
    @IBOutlet weak private var dropDownFrom: DropDownView!
    @IBOutlet weak private var dropDownTo: DropDownView!
    @IBOutlet weak private var nationalCurrencies: UITableView!
    
    var refreshControl: UIRefreshControl!
    private var viewModel: NationalCurrencyExchangeViewModelProtocol!
    private var nationalExBSDataService: NationalCurrencyExchangeBuySellDataService!
    // DI
    private var networkManager: NetworkManagerProtocol!
    private var currencyExchangeDataManager: CurrencyExchangeDataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unowned let vc = self
        networkManager = NetworkManager()
        // DI - Dependenc injection  NationalCurrencyExchangeViewModelProtocol
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
        configureDataSource()
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(vc, action: #selector(updateResultOfexchange), for: .valueChanged)
        refreshControl.addTarget(vc, action: #selector(configureDataSource), for: .valueChanged)
        scrolableContent.addSubview(refreshControl)
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
    
    
    @objc func updateResultOfexchange(){
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
    
    @objc private func configureDataSource() {
        unowned let vc = self
        viewModel = NationalCurrencyExchangeViewModel()
        nationalExBSDataService = NationalCurrencyExchangeBuySellDataService(withController: vc, with: nationalCurrencies, viewModel: viewModel)
        
        nationalExBSDataService.loadTableView(){ [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
}
