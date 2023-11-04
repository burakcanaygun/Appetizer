//
//  User.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 4.11.2023.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefill = false
}
