//
//  Person.swift
//  flavorful
//
//  Created by Fatima Abdinli on 28.04.24.
//

import Foundation
import RealmSwift

class Person: Object {
    
    @Persisted var name: String
    @Persisted var surname: String
    @Persisted var age: String
    @Persisted var email: String
    @Persisted var pass: String

    }
