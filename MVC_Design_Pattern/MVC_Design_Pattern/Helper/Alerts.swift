//
//  Alerts.swift
//  MVC_Design_Pattern
//
//  Created by Abhishek Bhardwaj on 13/01/24.
//


import UIKit

struct Alerts {
    static let shared = Alerts()
    private init() { }
    
    func showAlert(title: String, message: String, on viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { _ in
            viewController.dismiss(animated: true)
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true)
    }
}
