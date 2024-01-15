//
//  ViewController.swift
//  MVC_Design_Pattern
//
//  Created by Abhishek Bhardwaj on 13/01/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.text = ""
        var counter = 0.0
        let loginScreenTitle = "Login to Instagram"
        for letter in loginScreenTitle {
            Timer.scheduledTimer(withTimeInterval: 0.1 * counter, repeats: false) { _ in
                self.loginLabel.text?.append(letter)
            }
            counter += 1
        }
        emailField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(validateFields), for: .editingChanged )
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text {
            NetworkService.shared.networkCall(email: email, password: password, onVC: self) { success in
                if success {
                    self.goToUserVC()
                }
            }
        }
    }
    
    @objc private func validateFields() {
        loginButton.isEnabled = emailField.text != "" && passwordField.text != ""
    }
    
    private func goToUserVC() {
        let userVC = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        navigationController?.pushViewController(userVC, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

