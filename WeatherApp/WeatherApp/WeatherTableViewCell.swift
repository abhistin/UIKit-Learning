//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Abhishek Bhardwaj on 11/01/24.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var favImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(cityName: String) {
        cityLabel.text = cityName
//        self.favImage.image = favImage
    }
    @IBAction func favButtonTapped(_ sender: UIButton) {
        
        if City.isFavorite {
            favImage.image = UIImage(systemName: "heart")
            City.isFavorite = !City.isFavorite
        }
        else {
            favImage.image = UIImage(systemName: "heart.fill")
            City.isFavorite = !City.isFavorite
        }
    }
}
