//
//  AppIntroViewControllerDataService.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 20.12.21.
//

import UIKit

class AppIntroDataService: NSObject, UICollectionViewDataSource {
    
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
        startTimer()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(class: AppIntroPageCell.self, for: indexPath)
        cell.configure(with: pages[indexPath.row])
        return cell
    }
    
    
    func startTimer() {

        Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
            
            if let coll  = collectionView {
                for cell in coll.visibleCells {
                    let indexPath: IndexPath? = coll.indexPath(for: cell)
                    if ((indexPath?.row)!  < pages.count - 1){
                        let indexPath1: IndexPath?
                        indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                        
                        coll.scrollToItem(at: indexPath1!, at: .centeredHorizontally, animated: true)
                        pageDidChanged?(indexPath1!.row)
                    }
                    else{
                        let indexPath1: IndexPath?
                        indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                        coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                        pageDidChanged?(indexPath1!.row)
                    }
                    
                }
            }
            
        }

}


extension AppIntroDataService: UICollectionViewDelegate {
    
}

extension AppIntroDataService: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.bounds.size.width , height: collectionView.bounds.size.height)
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
