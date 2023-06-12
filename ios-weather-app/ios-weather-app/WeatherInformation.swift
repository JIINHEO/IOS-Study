//
//  WeatherInformation.swift
//  ios-weather-app
//
//  Created by 허지인 on 2021/11/08.
//

import Foundation

struct WeatherInformation: Codable{ // Codable : 자신을 변환하거나 외부표현으로 변환할 수 있는 타입(ex. json)
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey{
        case weather
        case temp = "main"
        case name
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
    let feels_like: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feels_like = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
