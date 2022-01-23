//
//  CurrencyTableViewCell.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 23.01.22.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backView.layer.cornerRadius = 15
        self.backView.layer.borderWidth = 5
        self.backView.layer.borderColor = UIColor.clear.cgColor
        self.backView.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.18
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowRadius = 15
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(with : CommercialRatesList){
        currencyLabel.text = with.currency
        buyLabel.text = "\(with.buy ?? 0.0)"
        sellLabel.text = "\(with.sell ?? 0.0)"
    }
    
}
