//
//  SignupVM.swift
//  flavorful
//
//  Created by Fatima Abdinli on 03.05.24.
//

import Foundation
import RealmSwift

class SignupVM {
    let realm = RealmHelper.instance.realm
    
//    save to Realm
    func saveObjectToRealm(name: String, surname: String, age: String, email: String, pass: String) {
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
