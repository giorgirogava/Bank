//
//  InterfaceController.swift
//  Cryptal Bank Watch WatchKit Extension
//
//  Created by IMAC on 06.01.22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var myButton: WKInterfaceButton!

    @IBOutlet weak var myTable: WKInterfaceGroup!
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    @IBAction func buttonTapped() {
        myButton.setTitle("Loading Cryptal Bank Application")
    }
    
}
