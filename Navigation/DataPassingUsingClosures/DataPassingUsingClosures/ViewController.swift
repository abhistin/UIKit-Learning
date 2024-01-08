//
//  ViewController.swift
//  DataPassingUsingClosures
//
//  Created by Abhishek Bhardwaj on 08/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Data received from SecondVC will be displayed below..."
    }


    @IBAction func seconVCPressed(_ sender: UIButton) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.completion = {
            email in
            self.label.text = email
            self.messageLabel.text = "Email Id got from SecondVC."
        }
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

