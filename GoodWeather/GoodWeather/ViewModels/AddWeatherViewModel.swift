//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by simon li on 26/5/2022.(lat: -33.86497, lon: 151.20777)
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        
        let weatherURL = Constants.Urls.urlForWeatherByLatLon(lat: -33, lon: 151)
            
        let weatherResource = Resource<Any>(url: weatherURL) { data in
            let weatherResource = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResource
        }
            
        Webservice().load(resource: weatherResource) { (result) in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource as! WeatherResponse)
                completion(vm)
            }
        }
        
    }
    
}
