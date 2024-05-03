//
//  LoginVC.swift
//  flavorful
//
//  Created by Fatima Abdinli on 24.04.24.
//

import UIKit
import RealmSwift

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
    
    private var peopleList: Results<Person>?
    let realm = RealmHelper.instance.realm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTarget()
        getPeopleList()
        print(realm?.configuration.fileURL ?? "")
    }
    
    fileprivate func getPeopleList() {
            let results = realm?.objects(Person.self)
            peopleList = results
    }
    
    fileprivate func setupView() {
        emailTextfield.delegate = self
        passTextfield.delegate = self
        scrollView.delegate = self
        signInButton.layer.cornerRadius = 8
    }
    
    fileprivate func setupTarget() {
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
    }
    
    @objc func signInAction() {
        checkUser()
    }
    
    public func showAlertMessage(title: String, message: String){
            
            let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alertMessagePopUpBox.addAction(okButton)
            self.present(alertMessagePopUpBox, animated: true)
        }
    
    fileprivate func checkUser() {
        guard let email = emailTextfield.text,
              let password = passTextfield.text,
              let list = peopleList else {return}
        
        if email.count < 6 && password.count < 5 {
            return
            
        } else {
            guard let user = list.first(where: {$0.email == email}) else {
                showAlertMessage(title: "Alert", message: "User not found")
                return
            }
            
            if user.pass == password {
//                logInSuccess()
                print(#function, "success")
            } else {
                showAlertMessage(title: "Alert", message: "Incorrect password")
            }
        }
    }
    
//    fileprivate func logInSuccess() {
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupVC") as? SignupVC
//            self.navigationController?.pushViewController(vc!, animated: true)
////            UserDefaultsHelper.setBool(key: Constant.UD_IS_LOGIN_KEY, value: true)
//        }
}

