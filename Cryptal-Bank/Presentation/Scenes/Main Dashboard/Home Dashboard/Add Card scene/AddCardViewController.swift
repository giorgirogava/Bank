//
//  AddCardViewController.swift
//  Cryptal-Bank
//
//  Created by Irakli Chkhitunidzde on 20.01.22.
//

import UIKit

class AddCardViewController: UIViewController {
    @IBOutlet weak var cardHolderInput: UITextField!
    @IBOutlet weak var binInput: UITextField!
    @IBOutlet weak var cvvInput: UITextField!
    @IBOutlet weak var exMonthInput: UITextField!
    @IBOutlet weak var exYearsInput: UITextField!
    
    private var viewModel: HomeDashboardViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     viewModel = HomeDashboardViewModel()
       // self.exYearsInput.delegate = self
    }

    @IBAction func OnSaveButtonClick(_ sender: Any) {
        viewModel?.saveCard(card: CardModel(name: cardHolderInput.text ?? "String?",
                                            owner: cardHolderInput.text,
                                           colour: 0x008000,
                                           expireData: "\(exMonthInput.text ?? "09")/\(exYearsInput.text ?? "26")",
                                            cardnumber: binInput.text ?? "XXXXX XXXX XXXX 6756",
                                           AcountNumber: "XXXX XXXXX 3434",
                                           cardType: CardType.VISA,
                                           money: [Money(balances: 121232.23, currency: CurrencyType.GEL),
                                                   Money(balances: 14352.23, currency: CurrencyType.USD)]
                                          ))
        let alert = UIAlertController(
            title: "Card Saved!",
            message: "",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
