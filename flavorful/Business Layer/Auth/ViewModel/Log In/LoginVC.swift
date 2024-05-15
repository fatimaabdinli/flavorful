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
//    var userName: String?
    
    private var peopleList: Results<Person>?
    let realm = RealmHelper.instance.realm
    
    let viewModel = LoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTarget()
        viewModel.getPeopleList()
        print(realm?.configuration.fileURL ?? "")
    }
    
    fileprivate func setupView() {
        emailTextfield.delegate = self
        passTextfield.delegate = self
        scrollView.delegate = self
        signInButton.layer.cornerRadius = 8
    }
    
    fileprivate func setupTarget() {
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    }
    
    @objc func signInAction() {
        checkUser()
    }
    
    @objc func signUpAction() {
         let vc = storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
    }
    
    fileprivate func checkUser() {
        guard let email = emailTextfield.text,
              let password = passTextfield.text,
              let list = viewModel.peopleList else {return}
        
        if email.count < 6 && password.count < 5 {
            return
            
        } else {
            guard let user = list.first(where: {$0.email == email}) else {
                self.showAlert(alertText: "Alert", alertMessage: "User not found")

                return
            }
            
            if user.pass == password {
                logInSuccess()
                UserDefaultsHelper.setString(key: "user_name", value: user.name)
            } else {
                self.showAlert(alertText: "Alert", alertMessage: "Incorrect password")
            }
        }
    }
    
    fileprivate func logInSuccess() {
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        navigationController?.pushViewController(vc, animated: true)
        UserDefaultsHelper.setBool(key: Constant.UD_IS_LOGIN_KEY, value: true)
    }
}

