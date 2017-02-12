//
//  Weather.swift
//  WeatherApp
//
//  Created by Kif on 12.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

import Foundation

struct Weather {

    struct Weather {
        let temp: Double
        var tempCelsius: Double {
            get {
                return temp - 273.15
            }
        }

        let windSpeed: Double
        let windDegrees: Double

    }
}
