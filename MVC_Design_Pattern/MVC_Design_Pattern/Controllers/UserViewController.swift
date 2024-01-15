//
//  UserViewController.swift
//  MVC_Design_Pattern
//
//  Created by Abhishek Bhardwaj on 13/01/24.
//

import UIKit

class UserViewController: UIViewController {

    private var user: User?
    @IBOutlet weak var userLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        user = NetworkService.shared.getUser()
        welcomeUser()
    }

    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func welcomeUser() {
        if let firstName = user?.firstName {
            userLabel.text = "Welcome \(firstName)"
        }
    }
}
