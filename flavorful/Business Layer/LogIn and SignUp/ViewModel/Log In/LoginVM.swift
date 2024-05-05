//
//  LoginVM.swift
//  flavorful
//
//  Created by Fatima Abdinli on 03.05.24.
//

import RealmSwift
import Foundation

class LoginVM {
    
    var peopleList: Results<Person>?
    let realm = RealmHelper.instance.realm
    
    func getPeopleList() {
            let results = realm?.objects(Person.self)
            peopleList = results
    }
}
