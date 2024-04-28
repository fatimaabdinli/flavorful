//
//  SignupVC.swift
//  flavorful
//
//  Created by Fatima Abdinli on 27.04.24.
//

import UIKit

class SignupVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        nameTextfield.delegate = self
        emailTextfield.delegate = self
        ageTextfield.delegate = self
        passTextfield.delegate = self
        scrollView.delegate = self
    }
}

extension SignupVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ sc: UIScrollView) {
        if sc.contentOffset.x != 0 {
              sc.contentOffset.x = 0
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
            
        case emailTextfield:
           if (textField.text?.count ?? 0) > 5 {
               emailTextfield.layer.borderWidth = 0
            
           } else {
               emailTextfield.layer.borderWidth = 1
               emailTextfield.layer.borderColor = UIColor.red.cgColor
           }
            
        case ageTextfield:
           if (textField.text?.count ?? 0) > 3 {
               ageTextfield.layer.borderWidth = 0
            
           } else {
               ageTextfield.layer.borderWidth = 1
               ageTextfield.layer.borderColor = UIColor.red.cgColor
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
