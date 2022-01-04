//
//  HomeDashboardViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 03.01.22.
//

import UIKit

class HomeDashboardViewController: UIViewController {
    @IBOutlet weak private var ballanceLabel: UILabel!
    @IBOutlet weak private var currencyLabel: UILabel!
    @IBOutlet weak private var eyeButton: UIButton!
    
    private var viewModel: HomeDashboardViewModelProtocol!
    private var dataService: HomeDashboardDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
    }
    
    private func configureDataSource() {
        viewModel = HomeDashboardViewModel()
        dataService = HomeDashboardDataService(withController: self,
                                               ballanceLabel: ballanceLabel,
                                               currencyLabel: currencyLabel,
                                               eyeButton: eyeButton,
                                               viewModel: viewModel)
        dataService.loadDashboard()
        
    }
    @IBAction func onEyeButtonClick(_ sender: UIButton) {
        dataService.changeBalanceHidenStatusTogle()
    }
}

