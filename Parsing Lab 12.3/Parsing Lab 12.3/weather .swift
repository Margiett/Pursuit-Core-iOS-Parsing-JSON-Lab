//
//  weather .swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/3/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [City]
    
}

struct City: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Codable {
    let description: String
}

extension WeatherData {
    
    static func getWeatherData() -> [City]{
        var citiesData = [City]()
        
        guard let fileUrl = Bundle.main.url(forResource: "cities with in the rectangle Zone", withExtension: "json") else {
            fatalError("could not locate file")
        }
        
        do{
            let data = try Data(contentsOf: fileUrl)
            
          
            let specificWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            
            
            citiesData = specificWeatherData.list
            
        } catch {
            fatalError("passing data from json into weather did not work \(error)")
        }
        return citiesData
    }
    
}
