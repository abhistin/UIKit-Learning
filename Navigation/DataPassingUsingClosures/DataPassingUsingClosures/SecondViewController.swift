//
//  SecondViewController.swift
//  DataPassingUsingClosures
//
//  Created by Abhishek Bhardwaj on 08/01/24.
//

import UIKit

class SecondViewController: UIViewController {

    typealias completionHandler = (String) -> Void
    var completion: completionHandler?
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: UIButton) {
        guard let email = textField.text else {return}
        if email.isEmpty {
            let alert = UIAlertController(title: "Please Enter Email", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { alert in
                
                self.dismiss(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
            return
        }
        guard let completionBlock = completion else {return}
        completionBlock(email)
        
        navigationController?.popViewController(animated: true)
    }
}
