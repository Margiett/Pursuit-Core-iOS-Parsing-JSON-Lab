//
//  RandomUserDetailViewController.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/4/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

class RandomUserDetailViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
     @IBOutlet weak var phoneNumberLabel: UILabel!
     @IBOutlet weak var dobLabel: UILabel!
     @IBOutlet weak var userImageView: UIImageView!
     
     var randomUser: RandomUser!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    func loadData() {
        guard let userDetail = randomUser else {
            fatalError("there is an issue")
        }
        
        
        let fullAddress = "\(randomUser.location.street.number) \(randomUser.location.street.name) \(randomUser.location.city) \(randomUser.location.country)"
        
        addressLabel.text = fullAddress
        phoneNumberLabel.text = userDetail.phone.description
    }
}
