//
//  HomeDashboardCardsDataService.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 07.01.22.
//

import UIKit

class HomeDashboardCardsDataService: NSObject, UICollectionViewDataSource {
    weak private var controller: UIViewController!
    weak private var viewModel: HomeDashboardViewModelProtocol!
    
    weak private var cardsCollectionView: UICollectionView!
    
    private var cards = [String](){
        
        willSet {
           
        }
        didSet {
            cardsCollectionView.reloadData()
            //viewModel.setToes(newToes: toes)
        }
    }
    
    init(withController: UIViewController,
         cardsCollectionView: UICollectionView,
         viewModel: HomeDashboardViewModelProtocol)
    {
        super.init()
        self.controller = withController
        self.cardsCollectionView = cardsCollectionView
        self.cardsCollectionView.dataSource = self
        self.cardsCollectionView.delegate = self
        //self.cardsCollectionView.isPagingEnabled = true
        self.cardsCollectionView.showsHorizontalScrollIndicator = false
        self.cardsCollectionView.registerNib(class: CardsCollectionViewCell.self)
        self.viewModel = viewModel
    }
    
    func refresh() {
//        toes = viewModel.getToes()
//        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  5 //toes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(class: CardsCollectionViewCell.self, for: indexPath)
       // cell.configure(with: toes[indexPath.row])
        return cell
    }
    
    
}


extension HomeDashboardCardsDataService: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.width / 6 * 5), height: (collectionView.bounds.size.height - 5 - 5))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
