//
//  UserDetailViewController.swift
//  NavigationStack
//
//  Created by Abhishek Bhardwaj on 11/01/24.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    var emailString: String! = nil
    var passwordString: String! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "You are logged In!"
        emailLabel.text = emailString
        passwordLabel.text = passwordString
        
        
        
    }

    @IBAction func logoutBtnTapped(_ sender: UIButton) {
        
        if let homeVC = navigationController?.viewControllers[0] {
            navigationController?.popToViewController(homeVC, animated: true)
        }
        else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
