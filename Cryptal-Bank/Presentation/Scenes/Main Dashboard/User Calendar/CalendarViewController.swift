//
//  CalendarViewController.swift
//  Cryptal-Bank
//
//  Created by IMAC on 24.12.21.
//

import FSCalendar
import UIKit

class CalendarViewController: UIViewController, FSCalendarDelegate {

    @IBOutlet var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self

        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print("\(string)")
        
    }

    

}
