//
//  NameTextField.swift
//  BasicUserDefaults
//
//  Created by Abhishek Bhardwaj on 09/01/24.
//

import UIKit

class NameTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpTextField()
    }
    
    
    private func setUpTextField() {
        tintColor       = Colors.darkGrey
        textColor       = Colors.darkGrey
        backgroundColor = .white
    }
    
    
    func updateStyle(isDarkMode: Bool) {
        let mainColor       = isDarkMode ? .white : Colors.darkGrey
        keyboardAppearance  = isDarkMode ? .dark : .light
        
        UIView.animate(withDuration: 0.4) {
            self.tintColor          = mainColor
            self.textColor          = mainColor
            self.backgroundColor    = isDarkMode ? Colors.darkGrey : .white
        }
    }
}
