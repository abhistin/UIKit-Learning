//
//  FriendTableViewCell.swift
//  Searching
//
//  Created by Abhishek Bhardwaj on 12/01/24.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(firstName: String, lastName: String) {
        firstNameLbl.text = firstName
        lastNameLbl.text = lastName
    }
}
