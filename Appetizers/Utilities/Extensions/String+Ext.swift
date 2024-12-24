//
//  String+Ext.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 24/12/2024.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
}
