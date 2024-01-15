//
//  RegisterViewController.swift
//  NavigationStack
//
//  Created by Abhishek Bhardwaj on 11/01/24.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        let emailText = emailTextField.text
        let passwordText = passwordTextField.text
        if emailText?.isEmpty ?? true && passwordText?.isEmpty ?? true {
            Alert.showAlert(title: "Invalid Credentials", message: "Email or Password cannot be empty", on: self)
            return
        }
        else if !emailText!.isValidEmail() {
            Alert.showAlert(title: "Invalid Email", message: "Please enter a valid email address", on: self)
            return
        }
        else if passwordText!.count < 8 {
            Alert.showAlert(title: "Invalid Password", message: "Password cannot be less than 8 characters", on: self)
            return
        }
        let userVC = storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        userVC.emailString = emailText
        userVC.passwordString = passwordText
        
        
        navigationController?.pushViewController(userVC, animated: true)
    }
    
}
