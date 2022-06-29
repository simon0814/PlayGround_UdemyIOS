//
//  Constants.swift
//  GoodWeather
//
//  Created by simon li on 26/5/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByLatLon(lat: Double, lon: Double) -> URL {
            
//            let userDefaults = UserDefaults.standard
//            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "metric"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=metric&appid=c3df66ec8794e8951a6b4108e42a4b9d")!
            
        }
        
    }
    
}
