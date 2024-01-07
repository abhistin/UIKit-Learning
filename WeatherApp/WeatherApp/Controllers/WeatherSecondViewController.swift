//
//  WeatherSecondViewController.swift
//  WeatherApp
//
//  Created by Abhishek Bhardwaj on 02/01/24.
//

import UIKit

class WeatherSecondViewController: UIViewController {

    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var cityTempLbl: UILabel!
    @IBOutlet weak var cityHumidityLbl: UILabel!
    @IBOutlet weak var cityWeatherDescriptionLbl: UILabel!
    @IBOutlet weak var cityLatLbl: UILabel!
    @IBOutlet weak var cityLonLbl: UILabel!
    var cityName: String! = nil
    var cityTemp: String! = nil
    var cityHumidity: String! = nil
    var cityWeatherDescription: String! = nil
    var cityLat: String! = nil
    var cityLon: String! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLbl.text = cityName
        cityTempLbl.text = cityTemp
        cityHumidityLbl.text = cityHumidity
        cityWeatherDescriptionLbl.text = cityWeatherDescription
        cityLatLbl.text = cityLat
        cityLonLbl.text = cityLon
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
    }

}
