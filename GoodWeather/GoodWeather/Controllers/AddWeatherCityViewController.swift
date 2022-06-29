//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by simon li on 24/5/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWeatherVM = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            if let city = cityNameTextField.text {
                addWeatherVM.addWeather(for: city) { vm in
                    self.delegate?.addWeatherDidSave(vm: vm)
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    @IBAction func close() {
        
        self.dismiss(animated: true)
        
    }
    
    
}
