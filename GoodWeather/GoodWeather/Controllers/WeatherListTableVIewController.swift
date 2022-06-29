//
//  WeatherListTableVIewController.swift
//  GoodWeather
//
//  Created by simon li on 24/5/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableVIewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        print(vm)
        self.weatherListViewModel.addWeatherViewModel(vm)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)
        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }
    }
    
    func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found!")
        }
        guard let settingsTableVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found!")
        }
        settingsTableVC.delegate = self
    }
    
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found!")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found!")
        }
        addWeatherCityVC.delegate = self
    }
    
}

extension WeatherListTableVIewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        
    }
}
