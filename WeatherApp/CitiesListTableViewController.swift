//
//  CitiesListTableViewController.swift
//  WeatherApp
//
//  Created by Kif on 12.02.17.
//  Copyright © 2017 KifApp. All rights reserved.
//

import UIKit

class CitiesListTableViewController: UITableViewController {

    let citiesName = ["Kiev","Amsterdam","Lisbon","Paris"]
    let citiesImage = [#imageLiteral(resourceName: "kiev_panorama"), #imageLiteral(resourceName: "Amster"), #imageLiteral(resourceName: "Lisboa"), #imageLiteral(resourceName: "Eyfel tower")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesName.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: CitiesCustomCell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CitiesCustomCell)!

        cell.cityName.text = citiesName[indexPath.row]
        cell.cityImage.image = citiesImage[indexPath.row]
        cell.cityImage.layer.masksToBounds = true
        cell.cityImage.layer.cornerRadius = 10

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let destination = segue.destination as! CityDetailsViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        let selectedCity = citiesName[(indexPath?.row)!]

        destination.cityNameFromTableView = selectedCity

    }


}
