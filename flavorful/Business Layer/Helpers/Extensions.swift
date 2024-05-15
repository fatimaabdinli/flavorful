//
//  Extensions.swift
//  flavorful
//
//  Created by Fatima Abdinli on 28.04.24.
//

import Foundation
import UIKit

extension LoginVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scroll: UIScrollView) {
        if scroll.contentOffset.x != 0 {
            scroll.contentOffset.x = 0
          }
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case emailTextfield:
           if (textField.text?.count ?? 0) > 5 {
               emailTextfield.layer.borderWidth = 0
       
           } else {
               emailTextfield.layer.borderWidth = 1
               emailTextfield.layer.borderColor = UIColor.red.cgColor
           }
            
        case passTextfield:
           if (textField.text?.count ?? 0) > 5 {
               passTextfield.layer.borderWidth = 0
            
           } else {
               passTextfield.layer.borderWidth = 1
               passTextfield.layer.borderColor = UIColor.red.cgColor
           }
            
        default:
            break
        }
    }
}

extension SignupVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scroll: UIScrollView) {
        if scroll.contentOffset.x != 0 {
            scroll.contentOffset.x = 0
          }
    }
}

extension SignupVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        switch textField {
        case nameTextfield:
           if (textField.text?.count ?? 0) > 3 {
               nameTextfield.layer.borderWidth = 0
       
           } else {
               nameTextfield.layer.borderWidth = 1
               nameTextfield.layer.borderColor = UIColor.red.cgColor
           }
            
        case surnameTextfield:
           if (textField.text?.count ?? 0) > 3 {
               surnameTextfield.layer.borderWidth = 0
       
           } else {
               surnameTextfield.layer.borderWidth = 1
               surnameTextfield.layer.borderColor = UIColor.red.cgColor
           }
            
        case ageTextfield:
           if (textField.text?.count ?? 0) < 4 {
               ageTextfield.layer.borderWidth = 0
            
           } else {
               ageTextfield.layer.borderWidth = 1
               ageTextfield.layer.borderColor = UIColor.red.cgColor
           }
            
        case emailTextfield:
           if (textField.text?.count ?? 0) > 5 {
               emailTextfield.layer.borderWidth = 0
            
           } else {
               emailTextfield.layer.borderWidth = 1
               emailTextfield.layer.borderColor = UIColor.red.cgColor
           }
            
        case passTextfield:
           if (textField.text?.count ?? 0) > 5 {
               passTextfield.layer.borderWidth = 0
            
           } else {
               passTextfield.layer.borderWidth = 1
               passTextfield.layer.borderColor = UIColor.red.cgColor
           }
            
        default:
            break
        }
    }
    
    func textLimit(existingText: String?,
                           newText: String,
                           limit: Int) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField == ageTextfield {
            return textLimit(existingText: textField.text,
                                  newText: string,
                                  limit: 3)
        } else {
            return true
        }
        
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.restorationIdentifier == "nameTextfield" {
            surnameTextfield.becomeFirstResponder()
        } else if textField.restorationIdentifier == "surnameTextfield" {
            ageTextfield.becomeFirstResponder()
        } else if textField.restorationIdentifier == "ageTextfield" {
            emailTextfield.becomeFirstResponder()
        } else if textField.restorationIdentifier == "emailTextfield" {
            passTextfield.becomeFirstResponder()
        }
         return true
     }
}

extension UIViewController {
//Show a basic alert
func showAlert(alertText : String, alertMessage : String) {
    let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//Add more actions as you see fit
self.present(alert, animated: true, completion: nil)
  }
}

extension UICollectionView {
    
    func registerNib(with identifier: String)
    {
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
    }
    
    func registerCodedCell(with cellClass: AnyClass)
    {
        let identifier = String(describing: cellClass.self)
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeCell<T>(cellClass : T.Type, indexPath: IndexPath) -> T where T: UICollectionViewCell
    {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
