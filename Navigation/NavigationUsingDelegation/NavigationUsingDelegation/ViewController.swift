//
//  ViewController.swift
//  NavigationUsingDelegation
//
//  Created by Abhishek Bhardwaj on 08/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func secondVCBtnPressed(_ sender: UIButton) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.delegate = self
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

extension ViewController: passDataToVC {
    func passDataToViewController(data: String) {
        if data.isEmpty {
            mailLabel.text = "Not Available."
        }
        else {
            mailLabel.text = data
        }
        
    }
    
    
}

