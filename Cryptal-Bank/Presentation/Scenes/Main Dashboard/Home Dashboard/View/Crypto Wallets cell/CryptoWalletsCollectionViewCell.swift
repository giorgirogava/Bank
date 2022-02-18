//
//  CryptoWalletsCollectionViewCell.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 18.02.22.
//

import UIKit
import Kingfisher

class CryptoWalletsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cryptoIcon: UIImageView!
    @IBOutlet weak var cryptoShortNameLabel: UILabel!
    @IBOutlet weak var cryptoLongNameLabel: UILabel!
    @IBOutlet weak var balanceInLocalCurrencyLabel: UILabel!
    @IBOutlet weak var balanceInCryptoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with: CryptoWalletModel){
        cryptoIcon.kf.setImage(with: URL(string: with.cryptoIcon ?? ""))
        cryptoShortNameLabel.text = with.cryptoShortName
        cryptoLongNameLabel.text = with.cryptoLongName
        balanceInCryptoLabel.text = "\(with.balanceInCrypto ?? 0) \(with.cryptoShortName ?? "")"
    }
}
