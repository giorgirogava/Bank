//
//  CryptoDataService.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 21.01.22.
//

import UIKit

class CryptoDataService: NSObject, UITableViewDataSource {
    weak private var controller: UIViewController!
    weak private var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    weak private var viewModel: CryptoViewModelProtocol!
    private var cryptos = [CryptoModelElement](){
        didSet{
            tableView.reloadWithAnimation()
        }
    }
    
    private var networkManager: NetworkManagerProtocol!
    private var cryptoDataManager: CryptoDataManager!
    
    
    init(withController: UIViewController, with tableView: UITableView, viewModel: CryptoViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
       // self.tableView.isPagingEnabled = true
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.registerNib(class: CryptoTableViewCell.self)
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
        cryptoDataManager = CryptoDataManager(networkManager: networkManager)
        
        cryptoDataManager.getCrypto(){ [weak self] all in
            DispatchQueue.main.async {
            self?.cryptos = all
                end()
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.deque(CryptoTableViewCell.self, for: indexPath)
        
        cell.configure(with: cryptos[indexPath.row])
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
}

extension  CryptoDataService: UITableViewDelegate {
    
    // Cell click listener
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
