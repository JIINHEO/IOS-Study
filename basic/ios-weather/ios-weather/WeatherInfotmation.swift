//
//  WeatherInfotmation.swift
//  ios-weather
//
//  Created by jiinheo on 2021/12/29.
//

import Foundation

struct WeatherInfotmation: Codable {
    let weather: [Weather]
    let temp: Temp
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
    }
}
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct Temp: Codable {
    let temp: Double
}

