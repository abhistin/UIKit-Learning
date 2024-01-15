//
//  WeatherSecondViewController.swift
//  WeatherApp
//
//  Created by Abhishek Bhardwaj on 02/01/24.
//

import UIKit

class WeatherSecondViewController: UIViewController {

    var cityWeather: CityWeather?
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var cityTempLbl: UILabel!
    @IBOutlet weak var cityHumidityLbl: UILabel!
    @IBOutlet weak var cityWeatherDescriptionLbl: UILabel!
    @IBOutlet weak var cityLatLbl: UILabel!
    @IBOutlet weak var cityLonLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        cityWeather = NetworkService.shared.getCityWeather()
        updateCityWeather()
        
    }
    private func updateCityWeather() {

            self.cityNameLbl.text = self.cityWeather?.name

            if let temp = self.cityWeather?.main.temp {
                self.cityTempLbl.text = String(temp)
            }

            if let humidity = self.cityWeather?.main.humidity {
                self.cityHumidityLbl.text = String(humidity)
            }

            self.cityWeatherDescriptionLbl.text = self.cityWeather?.weather.first?.description

            if let lat = self.cityWeather?.coord.lat {
                self.cityLatLbl.text = String(lat)
            }

            if let lon = self.cityWeather?.coord.lon {
                self.cityLonLbl.text = String(lon)
            }

    }


}
