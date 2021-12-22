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
            AppIntroPageModel(title: "Discounted Secondhand Books", imageName: "img_welcome_page_asset_1")
        ]
    }
}
