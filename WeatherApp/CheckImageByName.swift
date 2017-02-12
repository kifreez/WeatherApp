//
//  CheckImageByName.swift
//  WeatherApp
//
//  Created by Kif on 12.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

import Foundation

func checkImageByName(_ city: String) -> String {

    switch city {
    case "Kiev":
        return "kiev"
    case "Lisbon":
        return "lisbon"
    case "Amsterdam":
        return "amsterdam"
    case "Paris":
        return "paris"
    default:
        return ""
    }
}
