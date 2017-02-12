//
//  CityDetailsViewController.swift
//  WeatherApp
//
//  Created by Kif on 12.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

import UIKit

class CityDetailsViewController: UIViewController {
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var windDegrees: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var currentDate: UILabel!

    var cityNameFromTableView = String()
    let weather = GetWeater()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityName.text = cityNameFromTableView

        weather.getWeatherData("\(cityNameFromTableView)", completion: { (weather) in
            print(weather)
            self.setValueWeather(weather)
        }) { (error) in
            print("Error")
        }

    }

    func setValueWeather(_ weather:Weather) -> Void {
        let intTempValue = Int(floor(weather.tempCelsius))
        let intwindSpeed = Int(floor(weather.windSpeed))
        let intwindDegrees = Int(floor(weather.windDegrees))

        temperature.text = "\(intTempValue)"
        windSpeed.text = "\(intwindSpeed)"
        windDegrees.text = "\(intwindDegrees)"
    }



}
