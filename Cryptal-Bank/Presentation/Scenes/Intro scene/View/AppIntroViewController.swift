//
//  AppIntroViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 16.12.21.
//

import UIKit

class AppIntroViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customPageControl: CustomPageControl!
    
    private var viewModel: AppIntroViewModelProtocol!
    private var dataService: AppIntroDataService!
    
    
//    private var networkManager: NetworkManagerProtocol!
//    private var exchangeManager: ExchangeDataManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        customPageControl.unselectedItemColor =  .gray //UIColor(hex: "5ABD8C").withAlphaComponent(0.25)
        customPageControl.selectedItemColor = .blue   //UIColor(hex: "5ABD8C")

        configureDataSource()
        
        

//        networkManager = NetworkManager()
//        // DI - Dependenc injection
//        exchangeManager = ExchangeDataManager(networkManager: networkManager)
//
//        exchangeManager.getExchanges(){ rates in
//            print(rates)
//            print("ikakooo")
//        }
        // Do any additional setup after loading the view.
    }
    
    private func configureDataSource() {
        viewModel = AppIntroViewModel()
        customPageControl.numberOfItems = viewModel.getPages().count
        dataService = AppIntroDataService(with: collectionView,
                                         viewModel: viewModel)
        
        dataService.refresh()
        
        dataService.pageDidChanged = { pageIndex in
            self.customPageControl.currentPageIndex = pageIndex
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

}
