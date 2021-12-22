//
//  AppIntroViewControllerDataService.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 20.12.21.
//

import UIKit

class AppIntroViewDataService: NSObject, UICollectionViewDataSource {
    
    private var collectionView: UICollectionView!
    private var viewModel: AppIntroViewModelProtocol!
    private var pages = [AppIntroPageModel]()
    
    var pageDidChanged: ((Int) -> Void)?
    
    init(with collectionView: UICollectionView, viewModel: AppIntroViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.registerNib(class: AppIntroPageCell.self)
        
        self.viewModel = viewModel
    }
    
    
    func refresh() {
        pages = viewModel.getPages()
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(class: AppIntroPageCell.self, for: indexPath)
        //cell.configure(with: pages[indexPath.row])
        return cell
    }
}


extension AppIntroViewDataService: UICollectionViewDelegate {
    
}

extension AppIntroViewDataService: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let index = Int(x / UIScreen.main.bounds.width)
        pageDidChanged?(index)
    }
}
