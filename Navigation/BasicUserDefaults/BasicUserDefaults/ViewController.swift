//
//  ViewController.swift
//  BasicUserDefaults
//
//  Created by Abhishek Bhardwaj on 09/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var styleSegmentedControl: UISegmentedControl!
    @IBOutlet private var petImageView: UIImageView!
    @IBOutlet private var nameTextField: NameTextField!
    
    var isDarkMode = false
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let prefersDarkMode  = "prefersDarkMode"
        static let petName          = "petname"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPetImageView()
        checkForStylePreference()
        checkForSavedName()
    }
    
    
    func setupPetImageView() {
        petImageView.layer.cornerRadius = petImageView.frame.size.height / 2
        petImageView.clipsToBounds      = true
    }
    
    
    func updateStyle() {
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = self.isDarkMode ? Colors.darkGrey : .white
            self.nameTextField.updateStyle(isDarkMode: self.isDarkMode)
        }
    }
    
    
    @IBAction func didChangeStyleSegmentedControl(_ sender: UISegmentedControl) {
        isDarkMode = sender.selectedSegmentIndex == 1
        saveStylePreference()
        updateStyle()
    }
    
    
    @IBAction func saveButtonTapped(_ sender: SAButton) {
        saveName()
    }
    
    
    func saveStylePreference() {
        defaults.set(isDarkMode, forKey: Keys.prefersDarkMode)
    }
    
    
    func checkForStylePreference() {
        let prefersDarkMode = defaults.bool(forKey: Keys.prefersDarkMode)
        
        if prefersDarkMode {
            isDarkMode = true
            updateStyle()
            styleSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    
    func saveName() {
        defaults.set(nameTextField.text!, forKey: Keys.petName)
    }
    
    
    func checkForSavedName() {
        let name = defaults.value(forKey: Keys.petName) as? String ?? ""
        nameTextField.text = name
    }
}



