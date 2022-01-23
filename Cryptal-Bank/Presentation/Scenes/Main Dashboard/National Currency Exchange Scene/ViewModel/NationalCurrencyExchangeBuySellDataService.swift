//
//  NationalCurrencyExchangeDataService.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 23.01.22.
//

import UIKit

class NationalCurrencyExchangeBuySellDataService : NSObject, UITableViewDataSource{
    
    weak private var controller: UIViewController!
    weak private var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    weak private var viewModel: NationalCurrencyExchangeViewModelProtocol!
    private var currencies = [CommercialRatesList](){
        didSet{
            tableView.reloadWithAnimation()
        }
    }
    
    private var networkManager: NetworkManagerProtocol!
    private var currencyExchangeDataManager: CurrencyExchangeDataManager!
    
    
    init(withController: UIViewController, with tableView: UITableView, viewModel: NationalCurrencyExchangeViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
       // self.tableView.delegate = self
       // self.tableView.isPagingEnabled = true
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.registerNib(class: CurrencyTableViewCell.self)
        self.tableView.refreshControl = refreshControl
        refreshControl.attributedTitle = NSAttributedString(string: "Loading...")
        self.refreshControl.addTarget(self, action: #selector(swiperefresh(_:)), for: .valueChanged)
        
        self.viewModel = viewModel
    }
    
    @objc private func swiperefresh(_ sender: Any) {
        
        loadTableView(){
            self.refreshControl.endRefreshing()
        }
    }
    
    func loadTableView(end: @escaping () -> ()){
        networkManager = NetworkManager()
        // DI - Dependenc injection
        currencyExchangeDataManager = CurrencyExchangeDataManager(networkManager: networkManager)
        
        currencyExchangeDataManager.getAllNationalCurrencies(){ [weak self] all in
            DispatchQueue.main.async {
                self?.currencies = all.commercialRatesList ?? []
                end()
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.deque(CurrencyTableViewCell.self, for: indexPath)
        
        cell.configure(with: currencies[indexPath.row])
        
        return cell
    }
}
