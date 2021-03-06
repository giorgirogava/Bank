import UIKit
import UserNotifications

class NotificationController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
  
    @IBAction func setReminder(_ sender: UIButton) {
        
        
            let center = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            
            content.title = "TBC Bank"
            
            content.body = "Hi, it's TBC Bank We're glad to inform you that we have confirmed your payment. Thank you for using our service. "
            
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
            
            let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
            
            center.add(request) {
                (error) in
                if error != nil {
                    print("Error = \(error?.localizedDescription ?? "error local notification")")
                }
                
                
            }
    }
    
    
}
