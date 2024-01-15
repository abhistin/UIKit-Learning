//
//  User.swift
//  MVC_Design_Pattern
//
//  Created by Abhishek Bhardwaj on 13/01/24.
//

import Foundation
struct User {
    let firstName, lastName: String
    let age: Int
    let location: Location
}

struct Location {
    let latitude: Double
    let longitude: Double
}
