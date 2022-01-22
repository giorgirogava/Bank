//
//  CryptoViewController.swift
//  Cryptal-Bank
//
//  Created by IMAC on 16.12.21.
//

import UIKit

class CryptoViewController: UIViewController {
    @IBOutlet weak var cryptoTableView: UITableView!
    
    private var viewModel: CryptoViewModelProtocol!
    private var cryptoDataService: CryptoDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
    }
    
    private func configureDataSource() {
        unowned let vc = self
        viewModel = CryptoViewModel()
        cryptoDataService = CryptoDataService(withController: vc, with: cryptoTableView, viewModel: viewModel)
        
        cryptoDataService.loadTableView(){}
        
    }
}
