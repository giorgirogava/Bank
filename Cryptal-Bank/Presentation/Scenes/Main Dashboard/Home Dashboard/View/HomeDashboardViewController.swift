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
    
    var refreshControl: UIRefreshControl!
    
    private var viewModel: HomeDashboardViewModelProtocol!
    private var dataService: HomeDashboardDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
    }
    
    private func configureDataSource() {
        unowned let vc = self
        viewModel = HomeDashboardViewModel()
        dataService = HomeDashboardDataService(withController: vc,
                                               ballanceLabel: ballanceLabel,
                                               currencyLabel: currencyLabel,
                                               eyeButton: eyeButton,
                                               viewModel: viewModel)
        dataService.loadDashboard()
        
//        refreshControl = UIRefreshControl()
//        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
//        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        view.addSubview(refreshControl)
        
    }
    @IBAction func onEyeButtonClick(_ sender: UIButton) {
        dataService.changeBalanceHidenStatusTogle()
    }

//    @objc func refresh(_ sender: Any) {
//        //  your code to reload tableView
//    }
}

