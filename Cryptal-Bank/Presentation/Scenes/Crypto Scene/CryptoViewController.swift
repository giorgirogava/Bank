//
//  CryptoViewController.swift
//  Cryptal-Bank
//
//  Created by IMAC on 16.12.21.
//

import UIKit

class CryptoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        
        return tableView
        
    }()
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    
    //    static let numberFormatter = {
    //        let formatter = NumberFormatter()
    //        formatter.locale = .current
    //        formatter.allowsFloats = true
    //        formatter.numberStyle = .currency
    //        formatter.formatterBehavior = .default
    //
    //        return formatter
    //
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Live cry­pto­currency prices"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        APICaller.shared.getAllCryptoData { [weak self] result in
            
            switch result {
                
            case .success (let models):
                
                self?.viewModels = models.compactMap({
                    
                    //                    let price = $0.price_usd ?? 0
                    
                    // MARK: Bug
                    
                    //                    let formatter = ViewController.numberFormatter
                    //                    let priceString = formatter.string(from: NSNumber(value: price))
                    
                    CryptoTableViewCellViewModel(
                        name: $0.name ?? "N/A",
                        symbol: $0.asset_id,
                        //                                                 price: priceString ?? "N/A"
                        price: "$1"
                    )
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Error: \(error)")
                
                
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
