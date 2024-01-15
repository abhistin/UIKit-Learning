//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Abhishek Bhardwaj on 13/01/24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() { }
    
    private var cityWeather: CityWeather?
    func networkCall(cityName: String, completion: @escaping (Bool) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=977499de1e4e4b101262614640525a32")
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            guard let data = data else {
                print("Error while getting data: \(String(describing: error))")
                completion(false)
                return
            }
            let decoder = JSONDecoder()
            do {
                self.cityWeather = try decoder.decode(CityWeather.self, from: data)
                print("Got object: \(self.cityWeather)")
                    completion(true)
            }
            catch {
                print("Error while decoding the data: \(error)")
            }
        }
        dataTask.resume()
    }
    
    func getCityWeather() -> CityWeather? {
        return cityWeather
    }
}
