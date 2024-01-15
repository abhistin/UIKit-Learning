//
//  ViewController.swift
//  WeatherApp
//
//  Created by Abhishek Bhardwaj on 02/01/24.
//

import UIKit

class ViewController: UIViewController {
    var city = City()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "WeatherTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherTableViewCell")
        
        tableView.reloadData()
        
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return City.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        let cityNames = City.cities[indexPath.row].replacingOccurrences(of: "%20", with: " ")
        cell.setup(cityName: cityNames)
        if City.isFavorite {
            cell.favImage.image = UIImage(systemName: "heart")
            City.isFavorite = !City.isFavorite
        }
        else {
            cell.favImage.image = UIImage(systemName: "heart.fill")
            City.isFavorite = !City.isFavorite
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cityName = City.cities[indexPath.row]
        NetworkService.shared.networkCall(cityName: cityName) { success in
            if success {
                DispatchQueue.main.async {
                    let secondVC = self.storyboard?.instantiateViewController(identifier: "WeatherSecondViewController") as! WeatherSecondViewController
                    self.navigationController?.pushViewController(secondVC, animated: true)
                }
                
            }
        }
    }
}

