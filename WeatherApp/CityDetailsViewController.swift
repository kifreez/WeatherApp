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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}
