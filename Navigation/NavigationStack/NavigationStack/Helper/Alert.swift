//
//  Alert.swift
//  NavigationStack
//
//  Created by Abhishek Bhardwaj on 11/01/24.
//

import Foundation
import UIKit

class Alert {
    static func showAlert(title: String, message: String, on viewController: UIViewController, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
