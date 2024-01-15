//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Abhishek Bhardwaj on 09/01/24.
//

import UIKit

class ViewController: UIViewController {

    var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        let isOn = defaults.bool(forKey: "isSwitchOn")
        updateBackground(isOn: isOn)
    }

    @IBAction func `switch`(_ sender: UISwitch) {
        updateBackground(isOn: sender.isOn)
        defaults.set(sender.isOn, forKey: "isSwitchOn")
    }
    
    private func updateBackground(isOn: Bool) {
        view.backgroundColor = isOn ? .orange : .darkGray
    }
}

