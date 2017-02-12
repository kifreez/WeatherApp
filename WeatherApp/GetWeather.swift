//
//  GetWeather.swift
//  WeatherApp
//
//  Created by Kif on 12.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

import Foundation

class GetWeater {

    private let weatherBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let weatherAPIKey = "b3989046e5418f5ce592d16b1764dc70"

    func getWeatherData(_ city: String, completion:@escaping (_ weather:Weather) -> Void, errorHandler:@escaping (_ error:Error) -> Void) {

        let url = URL(string: "\(weatherBaseURL)?APPID=\(weatherAPIKey)&q=\(city)")

        guard let unwrapURL = url else {
            print("url == nil")
            return
        }

        let task = URLSession.shared.dataTask(with: unwrapURL) { (data, response, error) in

            if let errorCheck = error {

                print("Error Check is validate: \(errorCheck)")

                errorHandler(errorCheck)

            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] ?? ["":""]

                    let main = json["main"] as? [String:Any] ?? ["":""]
                    let wind = json["wind"] as? [String:Any] ?? ["":""]
                    let dt = json["dt"] as? Double ?? 0

                    let temp = main["temp"] as? Double ?? 0
                    let windSpeed = wind["speed"] as? Double ?? 0
                    let windDegrees = wind["deg"] as? Double ?? 0

                    let weather = Weather(temp: temp, windSpeed: windSpeed, windDegrees: windDegrees, date: dt)

                    DispatchQueue.main.async {
                        completion(weather)
                    }

                    print("JSON:\(json)")
                    print("MAIN:\(main)")
                    print("WIND:\(wind)")
                    print("DATE:\(dt)")

                } catch let error as NSError {
                    print("Error:\(error)")
                }
            }
        }
        task.resume()
    }
}
