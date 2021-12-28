//
//  IDCardViewController.swift
//  Cryptal-Bank
//
//  Created by IMAC on 28.12.21.
//

import UIKit

class IDCardViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func didTapButton(){
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
}


extension UIViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            
            return
        }
        
        // MARK: Cannot find
        
        // imageView.image = image
        
        
    }
    
    
}


