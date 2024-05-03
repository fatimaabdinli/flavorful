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
    
    private var peopleList: Results<Person>?
    let realm = RealmHelper.instance.realm
    
    
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
    }
    
    @objc func signUpAction() {
        if ((nameTextfield.text!.isEmpty)) || ((surnameTextfield.text!.isEmpty)) || ((ageTextfield.text!.isEmpty)) || ((emailTextfield.text!.isEmpty)) || ((passTextfield.text!.isEmpty)) {
            showAlertMessage(title: "Alert", message: "Fill all fields")
        } else {
            saveObjectToRealm(name: nameTextfield.text ?? "", surname: surnameTextfield.text ?? "", age: ageTextfield.text ?? "", email: emailTextfield.text ?? "", pass: passTextfield.text ?? "")
            dismiss(animated: true)
        }
    }
    
    @objc func signInAction() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
                self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    public func showAlertMessage(title: String, message: String) {
        let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertMessagePopUpBox.addAction(okButton)
        self.present(alertMessagePopUpBox, animated: true)
    }
    
    // save user to realm
    fileprivate func saveObjectToRealm(name: String, surname: String, age: String, email: String, pass: String) {
        let person = Person()
        person.name = name
        person.surname = surname
        person.age = age
        person.email = email
        person.pass = pass
        
        try! realm?.write() {
            realm?.add(person)
        }
    }
}
