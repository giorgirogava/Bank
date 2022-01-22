//
//  CryptoTableViewCell.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 21.01.22.
//

import UIKit
import Kingfisher

class CryptoTableViewCell: UITableViewCell {
    @IBOutlet weak var cryptoIcon: UIImageView!
    @IBOutlet weak var cryptoAronimLabel: UILabel!
    @IBOutlet weak var cryptoNameLabel: UILabel!
    @IBOutlet weak var cryptoValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(with viewModel: CryptoModelElement){
        cryptoValueLabel.text = "$\(viewModel.currentPrice ?? 0)"
        cryptoNameLabel.text = viewModel.name
        cryptoAronimLabel.text = viewModel.symbol
        cryptoIcon.kf.setImage(with: URL(string: viewModel.image ?? ""))
    }
}
