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
        
        RandomUrlAPI.fetchRandomUser(endpointURLString: "\(randomUser.picture.medium)") { (result) -> () in
            switch result {
            case .failure(let error):
                let alertController = UIAlertController(title: "Network Error", message: "\(error)" , preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                alertController.addAction(okAction)
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                    dump(error)
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self.userImageView.image = UIImage.init(data: image)
                }
                
//                DispatchQueue.main.async {
//                    self.userImageView.image = image.first?.results.
//                }
            }
        }
        
    }
    
}

//dump fullAddress
//userImageView.image = UIImage(data: userImageView)
