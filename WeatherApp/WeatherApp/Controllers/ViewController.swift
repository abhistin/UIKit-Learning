//
//  ViewController.swift
//  WeatherApp
//
//  Created by Abhishek Bhardwaj on 02/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        
    }
    
    @IBAction func favouriteBtnClicked(_ sender: UIButton) {
        
        
    }
    func navigateToSecondVC() {
        let secondVC = WeatherSecondViewController()
        modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return City.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = City.cities[indexPath.row].replacingOccurrences(of: "%20", with: " ")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cityName = City.cities[indexPath.row]
        City.networkCall(cityName: cityName) { cityWeatherObj, error in
            
            DispatchQueue.main.async {
                let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "WeatherSecondViewController") as! WeatherSecondViewController
                
                secondVC.cityName = "City Name: \(cityWeatherObj.name)"
                secondVC.cityTemp = "City Weather: \(String(cityWeatherObj.main.temp))"
                secondVC.cityHumidity = "City Humidity: \(String(cityWeatherObj.main.humidity))"
                secondVC.cityWeatherDescription = "City Weather Description: \(cityWeatherObj.weather[0].description)"
                secondVC.cityLat = "City Latitude: \(String(cityWeatherObj.coord.lat))"
                secondVC.cityLon = "City Longitude: \(String(cityWeatherObj.coord.lon))"

                self.navigationController?.pushViewController(secondVC, animated: true)
//                secondVC.modalPresentationStyle = .fullScreen
//                self.present(secondVC, animated: true)
            }
        }
    }
}

