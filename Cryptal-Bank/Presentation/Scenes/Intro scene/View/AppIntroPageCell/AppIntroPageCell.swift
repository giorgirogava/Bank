//
//  AppIntroPageCell.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 20.12.21.
//

import UIKit

class AppIntroPageCell: UICollectionViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewPageAsset: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
    }

    func configure(with item: AppIntroPageModel) {
        labelTitle.text = item.title
        imageViewPageAsset.image = UIImage(named: item.imageName)
    }
}
