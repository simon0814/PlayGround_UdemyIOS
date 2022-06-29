//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by simon li on 25/5/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.city
        self.temperatureLabel.text = "\(vm.temperature.formatAsDegree())°"
    }
    
}
