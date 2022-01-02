//
//  CreateAccountViewController.swift
//  Cryptal-Bank
//
//  Created by MacBook Pro on 16.12.21.
//

import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet private weak var usernameLabel: FloatingLabelInput!
    @IBOutlet private weak var emailLabel: FloatingLabelInput!
    @IBOutlet private weak var passwordLabel: FloatingLabelInput!
    @IBOutlet private weak var confirmPasswordLabel: FloatingLabelInput!
    
    
    private var viewModel: CreateAccountViewModelProtocol!
    private var dataService: CreateAccountDataService!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureDataSource()
    }
    
    private func configureDataSource() {
        unowned let vc = self
        viewModel = CreateAccountViewModel()
        dataService = CreateAccountDataService(withController: vc,
                                               usernameLabel: usernameLabel,
                                               emailLabel: emailLabel,
                                               passwordLabel: passwordLabel,
                                               confirmPasswordLabel: confirmPasswordLabel,
                                               viewModel: viewModel)
    }
    
    @IBAction func onUsernameTextChange(_ sender: Any) {
        dataService.updateUsernameInputStatus()
    }
    
    @IBAction func onEmailTextChanged(_ sender: Any) {
        dataService.updateEmailInputStatus()
    }
    @IBAction func onPasswordTextChanged(_ sender: Any) {
        dataService.updatePasswordInputStatus()
        dataService.updateConfirmPasswordInputStatus()
        
    }
    @IBAction func onConfirmPasswordTextChanged(_ sender: Any) {
        dataService.updateConfirmPasswordInputStatus()
        
    }
    @IBAction func onRegisterClicked(_ sender: Any) {
        dataService.updateUsernameInputStatus()
        dataService.updateEmailInputStatus()
        dataService.updatePasswordInputStatus()
        dataService.updateConfirmPasswordInputStatus()
        dataService.tryCreateAccount()
        
    }
    
    @IBAction func onLoginClick(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }

}
