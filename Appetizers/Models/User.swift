//
//  Account.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 24/12/2024.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email:String = ""
    var birthDate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
}
