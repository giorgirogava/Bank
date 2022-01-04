//
//  HomeDashboardDataService.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 03.01.22.
//

import UIKit

class HomeDashboardDataService:NSObject {
     weak private var controller: UIViewController!
     weak private var viewModel: HomeDashboardViewModelProtocol!
    
     weak private var ballanceLabel: UILabel!
     weak private var currencyLabel: UILabel!
     weak private var eyeButton: UIButton!
    
    init(withController: UIViewController,
         ballanceLabel: UILabel,
         currencyLabel: UILabel!,
         eyeButton: UIButton,
         viewModel: HomeDashboardViewModelProtocol)
    {
        super.init()
        self.controller = withController
        self.ballanceLabel = ballanceLabel
        self.currencyLabel = currencyLabel
        self.eyeButton = eyeButton
        self.viewModel = viewModel
    }
    
    func loadDashboard(){
        viewModel.isHidenLive(){ [unowned self] hiden in
            if hiden {
                self.eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                ballanceLabel.text = "$ $ $ $"
                currencyLabel.isHidden = true
            }else {
                self.eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
                
                viewModel.totalBalanceSingle(){[unowned self] balance in
                    ballanceLabel.text = balance.moneyFormat()
                }
                currencyLabel.isHidden = false
            }
        }
        
//        viewModel.totalBalanceLive(){[unowned self] balance in
//            
//            ballanceLabel.text = balance.moneyFormat()
//        }
    }
    
    
    func changeBalanceHidenStatusTogle(){
        viewModel.isHidenSingle(){ [unowned self] isHiden in
            var hiden = isHiden
            hiden.toggle()
            viewModel.balance(hide: hiden)
        }
        
    }
    
    
    
}

