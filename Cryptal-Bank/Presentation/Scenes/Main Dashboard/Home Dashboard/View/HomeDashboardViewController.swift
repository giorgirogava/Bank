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
    @IBOutlet weak private var cryptoWalletCollectionView: UICollectionView!
    
    
    var refreshControl: UIRefreshControl!
    
    private var viewModel: HomeDashboardViewModelProtocol!
    private var cryptoWalletViewModel: HomeDashboardCryptoWalletsViewModelProtocol!
    private var ballanceDataService: HomeDashboardTotalBallanceDataService!
    private var cardsDataService: HomeDashboardCardsDataService!
    private var cryptoWalletsDataService: HomeDashboardCryptoWalletsDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
    }
    
    private func configureDataSource() {
        unowned let vc = self
        viewModel = HomeDashboardViewModel()
        cryptoWalletViewModel = HomeDashboardCryptoWalletsViewModel()
        ballanceDataService = HomeDashboardTotalBallanceDataService(withController: vc,
                                                                    ballanceLabel: ballanceLabel,
                                                                    currencyLabel: currencyLabel,
                                                                    eyeButton: eyeButton,
                                                                    viewModel: viewModel)
        
        cardsDataService = HomeDashboardCardsDataService(withController: vc,
                                                         cardsCollectionView:cardsCollectionView,
                                                         viewModel: viewModel)
        
        cryptoWalletsDataService = HomeDashboardCryptoWalletsDataService(withController: vc,
                                                         cardsCollectionView:cryptoWalletCollectionView,
                                                         viewModel: cryptoWalletViewModel)
        //ballanceDataService.loadDashboard(){}
        
        cardsDataService.refresh(){}
        cryptoWalletsDataService.refresh(){}
        
        cardsDataService.sumOfCards(){ [unowned self] totalMoney in
            ballanceDataService.setSumOfCards(money: totalMoney)
        }
        
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
        var setSumOfCardsLoadinEnd = false
        var cardsDataServiceLoadinEnd = false
        
        cardsDataService.sumOfCards(){ [unowned self] totalMoney in
            setSumOfCardsLoadinEnd = true
            
            if setSumOfCardsLoadinEnd && cardsDataServiceLoadinEnd {
                ballanceDataService.setSumOfCards(money: totalMoney)
                refreshControl.endRefreshing()
            }
            
        }
        cardsDataService.refresh(){ [unowned self] in
            cardsDataServiceLoadinEnd = true
            
            if setSumOfCardsLoadinEnd && cardsDataServiceLoadinEnd {
                refreshControl.endRefreshing()
            }
        }
        cryptoWalletsDataService.refresh(){}
        
    }
}

