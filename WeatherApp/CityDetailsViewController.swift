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
    @IBOutlet weak var cityImage: UIImageView!

    var cityNameFromTableView = String()
    let weather = GetWeater()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityName.text = cityNameFromTableView

        cityImage.image = UIImage(named: checkImageByName(cityNameFromTableView))


        weather.getWeatherData("\(cityNameFromTableView)", completion: { (weather) in
            print(weather)
            self.setValueWeather(weather)
        }) { (error) in
            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }

    func setValueWeather(_ weather:Weather) -> Void {
        let intTempValue = Int(floor(weather.tempCelsius))
        let intwindSpeed = Int(floor(weather.windSpeed))
        let intwindDegrees = Int(floor(weather.windDegrees))
        
        let date = Date(timeIntervalSince1970: weather.date)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"

        let formatedDate = formatter.string(from: date)


        temperature.text = "\(intTempValue)\u{00B0}"
        windSpeed.text = "Wind speed: \(intwindSpeed) m/s"
        windDegrees.text = "Wind direction: \(intwindDegrees)\u{00B0}"
        currentDate.text = "\(formatedDate)"
    }



}
