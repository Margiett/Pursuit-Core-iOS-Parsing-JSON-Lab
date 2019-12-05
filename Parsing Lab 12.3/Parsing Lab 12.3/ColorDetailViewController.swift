//
//  ColorDetailViewController.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/4/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
        @IBOutlet weak var hexValueLabel: UILabel!
        @IBOutlet weak var redValueLabel: UILabel!
        @IBOutlet weak var greenValueLabel: UILabel!
        @IBOutlet weak var blueValueLabel: UILabel!
        
    var didSetColorsInfo: Color?
//    didSet {
//        colorView.reloadData()
//    }
//    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            loadDataColor()
        }

        func loadDataColor(){
            guard let info = didSetColorsInfo else{
                fatalError("there is nothing is colors")
            }
            
            let red = CGFloat(info.rgb.r / 255)
            
            let green = CGFloat(info.rgb.g / 255)
            
            let blue = CGFloat(info.rgb.b / 255)
            
            let hexValue = info.hex["value"] ?? ""
            
            colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
            
            hexValueLabel.text = "hex value: \(hexValue)"
            
            redValueLabel.text = "red value: \(info.rgb.r.description)"
            
            greenValueLabel.text = "green value: \(info.rgb.g.description)"
            
            blueValueLabel.text = "blue value: \(info.rgb.b.description)"
        }

    }

