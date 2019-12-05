//
//  WeatherAPIViewController.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/3/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

class WeatherAPIViewController: UIViewController {

        @IBOutlet weak var tableView: UITableView!
      
        var didSetCitiesInfo = [City](){
            didSet{
                
                tableView.reloadData()
            }
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()

            loadData()
            tableView.dataSource = self
        }
        
        
        func loadData() {
            didSetCitiesInfo = WeatherData.getWeatherData()
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let viewController = segue.destination as? ViewController, let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("the segue needs to be checked")
            }
         
            viewController.chosenCity = didSetCitiesInfo[indexPath.row]
            
        }

    }

    extension WeatherAPIViewController: UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return didSetCitiesInfo.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
             let cell = tableView.dequeueReusableCell(withIdentifier: "citiesCell", for: indexPath)
            
          //
            let selectedcities = didSetCitiesInfo[indexPath.row]
            
            cell.textLabel?.text = selectedcities.name
        
            
             return cell
            
            
        }
        
        
    }

