//
//  String+Extensions.swift
//  NavigationStack
//
//  Created by Abhishek Bhardwaj on 11/01/24.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        // Regular expression for a simple email validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
