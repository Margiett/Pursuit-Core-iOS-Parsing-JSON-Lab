//
//  ViewController.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/3/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    var chosenCity: City?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        navigationItem.title = chosenCity?.name
        
        guard let aCity = chosenCity else {
            return
        }
        
        // need to say .first because =
        guard let weatherDescription = aCity.weather.first?.description else {
            return
        }
        
        currentWeatherLabel.text = ( " There will be \(weatherDescription)")
        
        tempLabel.text = (" It is \(aCity.main.temp.description)˚C ")
    }

}

