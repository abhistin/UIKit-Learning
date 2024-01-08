//
//  SecondViewController.swift
//  NavigationUsingDelegation
//
//  Created by Abhishek Bhardwaj on 08/01/24.
//

import UIKit

protocol passDataToVC {
    func passDataToViewController(data: String)
}
class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var delegate: passDataToVC?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        guard let inputText = textField.text else {return}
        delegate?.passDataToViewController(data: inputText)
        navigationController?.popViewController(animated: true)
    }
}
