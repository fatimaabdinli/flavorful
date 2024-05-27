//
//  SignupVC.swift
//  flavorful
//
//  Created by Fatima Abdinli on 27.04.24.
//

import UIKit
import RealmSwift

class SignupVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var surnameTextfield: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    var saveCb: (() -> Void)?
    
    private var peopleList: Results<Person>?
    let realm = RealmHelper.instance.realm
    
    let viewModel = SignupVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(realm?.configuration.fileURL ?? "")
        setupView()
        setupTarget()
    }
    
    fileprivate func setupView() {
        nameTextfield.delegate = self
        surnameTextfield.delegate = self
        ageTextfield.delegate = self
        emailTextfield.delegate = self
        passTextfield.delegate = self
        scrollView.delegate = self
        signUpButton.layer.cornerRadius = 8
        nameTextfield.returnKeyType = .done
        surnameTextfield.returnKeyType = .done
        emailTextfield.returnKeyType = .done
        ageTextfield.returnKeyType = .done
        passTextfield.returnKeyType = .done
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    fileprivate func setupTarget() {
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
//    check and save user data to Realm
    @objc func signUpAction() {
        if ((nameTextfield.text!.isEmpty)) || ((surnameTextfield.text!.isEmpty)) || ((ageTextfield.text!.isEmpty)) || ((emailTextfield.text!.isEmpty)) || ((passTextfield.text!.isEmpty)) {
            self.showAlert(alertText: "Alert", alertMessage: "Fill all fields")
//            showAlertMessage(title: "Alert", message: "Fill all fields")
        } else {
            guard let name = nameTextfield.text, let surname = surnameTextfield.text, let age = ageTextfield.text, let email = emailTextfield.text, let pass = passTextfield.text else {return}
            viewModel.saveObjectToRealm(name: name, surname: surname, age: age, email: email, pass: pass)
            saveCb?()
            dismiss(animated: true)
        }
    }
    
    @objc func signInAction() {
        dismiss(animated: true)
    }
    
    @objc func dismissAction() {
        dismiss(animated: true)
    }
}
