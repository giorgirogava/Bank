//
//  CustomPageControl.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 20.12.21.
//

import UIKit

class CustomPageControl: UIView {
    
    private var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.spacing = 14
        sv.axis = .horizontal
        return sv
    }()
    
    var numberOfItems: Int = 0 {
        didSet {
            configureItems()
        }
    }
    
    var unselectedItemColor: UIColor = .clear {
        didSet {
            configureItems()
        }
    }
    
    var selectedItemColor: UIColor = .clear {
        didSet {
            configureItems()
        }
    }
    
    var currentPageIndex: Int = 0 {
        didSet {
            changePage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    private func configure() {
        loadViews()
        setupLayout()
    }
    
    private func loadViews() {
        addSubview(stackView)
    }
    
    private func  setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func configureItems() {
        stackView.arrangedSubviews.forEach { stackView.removeArrangedSubview($0) }
        
        for index in 0..<numberOfItems {
            let dotView = UIView()
            dotView.translatesAutoresizingMaskIntoConstraints = false
            dotView.widthAnchor.constraint(equalToConstant: 14).isActive = true
            dotView.heightAnchor.constraint(equalToConstant: 14).isActive = true
            dotView.backgroundColor = index == 0 ? selectedItemColor : unselectedItemColor
            dotView.layer.cornerRadius = 14 / 2
            stackView.addArrangedSubview(dotView)
        }
    }
    
    private func changePage() {
        for (index, item) in stackView.arrangedSubviews.enumerated() {
//            if index == currentPageIndex {
//                item.backgroundColor = selectedItemColor
//            } else {
//                item.backgroundColor = unselectedItemColor
//            }
            
            item.backgroundColor = index == currentPageIndex ? selectedItemColor : unselectedItemColor
        }
    }
}

