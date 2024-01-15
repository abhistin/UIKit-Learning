//
//  ViewController.swift
//  NavigationStack
//
//  Created by Abhishek Bhardwaj on 11/01/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var mainScreenLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreenLbl.text = ""
        
        var charIndex = 0.0
        let titleText = "Hi Welcome to my App!"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.mainScreenLbl.text?.append(letter)
            }
            charIndex += 1
        }
    }


}

