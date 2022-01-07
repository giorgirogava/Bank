//
//  HomeDashboardViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 03.01.22.
//

import UIKit

class HomeDashboardViewController: UIViewController {
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var ballanceLabel: UILabel!
    @IBOutlet weak private var currencyLabel: UILabel!
    @IBOutlet weak private var eyeButton: UIButton!
    @IBOutlet weak private var cardsCollectionView: UICollectionView!
    
    
    var refreshControl: UIRefreshControl!
    
    private var viewModel: HomeDashboardViewModelProtocol!
    private var ballanceDataService: HomeDashboardTotalBallanceDataService!
    private var cardsDataService: HomeDashboardCardsDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
    }
    
    private func configureDataSource() {
        unowned let vc = self
        viewModel = HomeDashboardViewModel()
        ballanceDataService = HomeDashboardTotalBallanceDataService(withController: vc,
                                               ballanceLabel: ballanceLabel,
                                               currencyLabel: currencyLabel,
                                               eyeButton: eyeButton,
                                               viewModel: viewModel)
        
        cardsDataService = HomeDashboardCardsDataService(withController: vc,
                                                         cardsCollectionView:cardsCollectionView,
                                                         viewModel: viewModel)
        
        
        ballanceDataService.loadDashboard()
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(vc, action: #selector(refresh), for: .valueChanged)
        scrollView.addSubview(refreshControl)
        
    }
    @IBAction func onEyeButtonClick(_ sender: UIButton) {
        ballanceDataService.changeBalanceHidenStatusTogle()
    }

    @objc func refresh(_ sender: Any) {
        //  your code to reload tableView
    }
}

