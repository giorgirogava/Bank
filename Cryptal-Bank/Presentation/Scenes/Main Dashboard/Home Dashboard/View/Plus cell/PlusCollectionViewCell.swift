//
//  PlusCollectionViewCell.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 19.01.22.
//

import UIKit

class PlusCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with title: String){
        titleLabel.text = title
    }

}
