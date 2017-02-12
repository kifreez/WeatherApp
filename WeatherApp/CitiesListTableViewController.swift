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

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = citiesName[indexPath.row]

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let destination = segue.destination as! CityDetailsViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        let selectedCity = citiesName[(indexPath?.row)!]

        destination.cityNameFromTableView = selectedCity

    }


}
