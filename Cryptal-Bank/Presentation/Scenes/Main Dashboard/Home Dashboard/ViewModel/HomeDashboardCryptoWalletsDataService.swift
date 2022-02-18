//
//  HomeDashboardCryptoWalletsDataService.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 18.02.22.
//

import UIKit

class HomeDashboardCryptoWalletsDataService : NSObject, UICollectionViewDataSource {
    weak private var controller: UIViewController!
    weak private var viewModel: HomeDashboardCryptoWalletsViewModelProtocol!
    
    weak private var cardsCollectionView: UICollectionView!
    
    private var cryptoWallets = [CryptoWalletModel](){
        
        willSet {
            
        }
        didSet {
            cardsCollectionView.reloadData()
            //viewModel.setToes(newToes: toes)
        }
    }
    
    init(withController: UIViewController,
         cardsCollectionView: UICollectionView,
         viewModel: HomeDashboardCryptoWalletsViewModelProtocol)
    {
        super.init()
        self.controller = withController
        self.cardsCollectionView = cardsCollectionView
        self.cardsCollectionView.dataSource = self
        self.cardsCollectionView.delegate = self
        //self.cardsCollectionView.isPagingEnabled = true
        self.cardsCollectionView.showsHorizontalScrollIndicator = false
        self.cardsCollectionView.registerNib(class: CryptoWalletsCollectionViewCell.self)
        self.cardsCollectionView.registerNib(class: PlusCollectionViewCell.self)
        self.viewModel = viewModel
    }
    
    
    func refresh(end: @escaping () -> ()) {
        
        //         viewModel.getCards(){ [unowned self] all in
        //             cards = all
        //          }
        viewModel.getCryptoWalletsSingle(){ [unowned self] all in
            cryptoWallets = all
        }
//
//
//        cardsCollectionView.reloadData()
//        viewModel.getCardsSingle(){ it in
//
//
//        }
        end()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  cryptoWallets.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row < cryptoWallets.count {
            let  cell = collectionView.deque(class: CryptoWalletsCollectionViewCell.self, for: indexPath)
            cell.configure(with: cryptoWallets[indexPath.row])
            cell.gridAnimationCell(indexPath: indexPath)
            
            return cell
        }else {
            let  cell = collectionView.deque(class: PlusCollectionViewCell.self, for: indexPath)
            cell.configure(with: "Add Crypto Wallet")
            cell.gridAnimationCell(indexPath: indexPath)
            return cell
        }
    }
}


extension HomeDashboardCryptoWalletsDataService: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.width / 6 * 5), height: (collectionView.bounds.size.height - 5 - 5))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == cryptoWallets.count {
            viewModel.saveCryptoWallet()
        }
    }
    
}
