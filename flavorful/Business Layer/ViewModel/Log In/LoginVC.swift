//
//  LoginVC.swift
//  flavorful
//
//  Created by Fatima Abdinli on 24.04.24.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        emailTextfield.delegate = self
        passTextfield.delegate = self
        scrollView.delegate = self
    }
}

extension LoginVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ sc: UIScrollView) {
        if sc.contentOffset.x != 0 {
              sc.contentOffset.x = 0
          }
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case emailTextfield:
           if (textField.text?.count ?? 0) > 6 {
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
