//
//  City.swift
//  WeatherApp
//
//  Created by Abhishek Bhardwaj on 02/01/24.
//

import Foundation

struct City {
    static var isFavorite: Bool = false
    static let cities = [
        "New%20York", "Los%20Angeles", "Chicago", "Houston", "Phoenix",
            "Philadelphia", "San%20Antonio", "San%20Diego", "Dallas", "San%20Jose",
            "Austin", "Jacksonville", "Fort%20Worth", "Columbus", "Charlotte",
            "San%20Francisco", "Indianapolis", "Seattle", "Denver", "Washington",
            "Boston", "El%20Paso", "Nashville", "Detroit", "Oklahoma%20City",
            "Portland", "Las%20Vegas", "Memphis", "Louisville", "Baltimore",
            "Milwaukee", "Albuquerque", "Tucson", "Fresno", "Sacramento",
            "Mesa", "Atlanta", "Kansas%20City", "Colorado%20Springs", "Miami",
            "Raleigh", "Omaha", "Long%20Beach", "Virginia%20Beach", "Oakland",
            "Minneapolis", "Tulsa", "Arlington", "Tampa", "New%20Orleans",
            "London", "Birmingham", "Leeds", "Glasgow", "Sheffield",
            "Bradford", "Liverpool", "Edinburgh", "Manchester", "Bristol",
            "Kirklees", "Fife", "Wirral", "North%20Lanarkshire", "Wakefield",
            "Cardiff", "Dudley", "Wigan", "East%20Riding", "South%20Lanarkshire",
            "Coventry", "Belfast", "Leicester", "Sunderland", "Sandwell",
            "Doncaster", "Stockport", "Sefton", "Nottingham", "Newcastle-upon-Tyne",
            "Kingston-upon-Hull", "Bolton", "Walsall", "Plymouth", "Rotherham",
            "Stoke-on-Trent", "Wolverhampton", "Rhondda", "Derby", "Swansea",
            "Salford", "Aberdeenshire", "Barnsley", "Tameside", "Oldham",
            "Trafford", "Aberdeen", "Southampton", "Highland", "Rochdale",
            "Solihull", "Gateshead", "Milton%20Keynes", "North%20Tyneside", "Calderdale",
            "Northampton", "Portsmouth", "Warrington", "North%20Somerset", "Bury"

    ].sorted()
}

struct CityWeather: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

