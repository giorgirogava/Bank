//
//  CryptoViewController.swift
//  Cryptal-Bank
//
//  Created by IMAC on 16.12.21.
//

import UIKit

class CryptoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var networkManager: NetworkManagerProtocol!
    private var exchangeManager: ExchangeDataManager!
    
    private let tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        
        return tableView
        
    }()
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Live cry­pto­currency prices"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        networkManager = NetworkManager()
        // DI - Dependenc injection
        exchangeManager = ExchangeDataManager(networkManager: networkManager)
        
        exchangeManager.getExchanges(){ rates in
            print(rates)
            print("ikakooo")
            
            DispatchQueue.main.async {
                self.viewModels = rates.compactMap({
                    
                    CryptoTableViewCellViewModel(
                        name: $0.name ?? "N/A",
                        symbol: $0.assetID ?? "",
                        price: "\($0.priceUsd ?? 0.0)"
                    )
                })
                
                self.tableView.reloadData()
            }
        }

        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModels.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
