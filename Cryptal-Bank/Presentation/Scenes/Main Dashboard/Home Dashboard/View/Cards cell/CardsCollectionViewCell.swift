//
//  CardsCollectionViewCell.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 07.01.22.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var card: UIViewAdditionalFeatures!
    @IBOutlet weak private var balancesStack: UIStackView!
    @IBOutlet weak private var cardType: UIImageView!
    @IBOutlet weak private var cardNumber: UILabel!
    @IBOutlet weak private var cardExpireDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with:CardModel){
        
        if let colour = with.colour {
            card.backgroundColor = UIColor(rgb: colour)
        }
        
        if let type = with.cardType {
            switch type {
            case CardType.MASTER: cardType.image = UIImage(named: "ic_mastercard_new")
            case CardType.VISA: cardType.image = UIImage(named: "ic_visa")
            //default: cardType.image = UIImage(named: "ic_masterCard")
            }
        }
        
        if let number = with.cardnumber {
            cardNumber.text = number
        }
        if let data = with.expireData {
            cardExpireDate.text = data
        }
        
        
        balancesStack.removeAllArrangedSubviews()
        with.money?.forEach{ money in
                let label = UILabel()
            guard let balance = money.balances,
                  let currency = money.Currency
            else { return }
            
                label.text = "\(String(balance).moneyFormat()) \(currency)"
                label.textAlignment = .right
                balancesStack.addArrangedSubview(label)
            }
    
        
    }
    
}
