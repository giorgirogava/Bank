//
//  AppIntroViewControllerViewModel.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 20.12.21.
//

import Foundation

protocol AppIntroViewModelProtocol:AnyObject{
    func getPages() -> [AppIntroPageModel]
}

final class AppIntroViewModel: AppIntroViewModelProtocol {
    func getPages() -> [AppIntroPageModel] {
        return [
            AppIntroPageModel(title: "Property Diversity", imageName: "p_chart"),
            AppIntroPageModel(title: "Safe Security", imageName: "p_safe"),
            AppIntroPageModel(title: "Convenient Transaction", imageName: "p_rocet")
        ]
    }
}
