//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by simon li on 26/5/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
    let name: String
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
