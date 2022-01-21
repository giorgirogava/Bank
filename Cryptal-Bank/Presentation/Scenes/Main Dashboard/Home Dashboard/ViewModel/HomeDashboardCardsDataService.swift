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
    
    private var cards = [CardModel](){
        
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
        self.cardsCollectionView.registerNib(class: PlusCollectionViewCell.self)
        self.viewModel = viewModel
    }
    
    func refresh(end: @escaping () -> ()) {
        
        //         viewModel.getCards(){ [unowned self] all in
        //             cards = all
        //          }
        viewModel.getCardsSingle(){ [unowned self] all in
            cards = all
            
        }
        
        
        cardsCollectionView.reloadData()
        viewModel.getCardsSingle(){ it in
            
            
        }
        end()
    }
    
    func sumOfCards(money: @escaping (String) -> ()){
        viewModel.getCardsSingle(){ all in
            
            let total = all.map{ card -> Double in
                
                var cardMoney = 0.0
                
                card.money?.forEach{ money in
                    guard let balance = money.balances
                            //let currency = money.currency
                    else { return }
                    cardMoney += balance
                }
                
                return cardMoney
            }.reduce(.zero, +)
            money("\(total)")
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  cards.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row < cards.count {
            let  cell = collectionView.deque(class: CardsCollectionViewCell.self, for: indexPath)
            cell.configure(with: cards[indexPath.row])
            return cell
        }else {
            return collectionView.deque(class: PlusCollectionViewCell.self, for: indexPath)
        }
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
        
        if indexPath.row == cards.count {
            let sb = UIStoryboard(name: "AddCardViewController", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "AddCardViewController")
            controller.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
