//
//  ColorAPIViewController.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/4/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

class ColorAPIViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var didSetColor = [Color]() {
   
        didSet {
        tableView.reloadData()
    }
        
}
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        
    }
    func loadData() {
        didSetColor = ColorsBrain.getColors()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorDetailViewController = segue.destination as? ColorDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("the sugue is not working")
        }
        colorDetailViewController.didSetColorsInfo = didSetColor[indexPath.row]
    } // override func prepare for segue curly

} // class curly


extension ColorAPIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return didSetColor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let selectedColor = didSetColor[indexPath.row]
        
        cell.textLabel?.text = selectedColor.name.value
        
        cell.textLabel?.textColor = .white
        
        cell.backgroundColor = UIColor(red: CGFloat(selectedColor.rgb.r / 255), green: CGFloat(selectedColor.rgb.g / 255), blue: CGFloat(selectedColor.rgb.b / 255), alpha: 1)
        
        
        return cell
    }
    

} // curly for the extension
