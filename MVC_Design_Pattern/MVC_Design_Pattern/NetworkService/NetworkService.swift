//
//  NetworkService.swift
//  MVC_Design_Pattern
//
//  Created by Abhishek Bhardwaj on 13/01/24.
//

import Foundation
import UIKit
import ProgressHUD
class NetworkService {
    
    static let shared = NetworkService()
    private init(){}
    
    private var user: User?
    func networkCall(email: String, password: String, onVC viewController: UIViewController, completion: @escaping (Bool) -> Void) {
        ProgressHUD.show()
        DispatchQueue.global().async {
            sleep(2)
            
            DispatchQueue.main.async {
                if email == "Test@gmail.com" && password == "Test@123" {
                    self.user = User(firstName: "Priyag Raj", lastName: "Sharma", age: 23, location: Location(latitude: 123.321, longitude: 321.123))
                    completion(true)
                    ProgressHUD.dismiss()
                } else {
                    Alerts.shared.showAlert(title: "Invalid Credentials", message: "Please Enter Valid Credentials.", on: viewController)
                    completion(false)
                    ProgressHUD.dismiss()
                }
            }
        }
    }
    
    func getUser() -> User? {
        return user
    }
}
