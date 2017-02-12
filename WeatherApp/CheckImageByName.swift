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
        return "kiev_panorama"
    case "Lisbon":
        return "Lisboa"
    case "Amsterdam":
        return "Amster"
    case "Paris":
        return "Eyfel tower"
    default:
        return ""
    }
}
