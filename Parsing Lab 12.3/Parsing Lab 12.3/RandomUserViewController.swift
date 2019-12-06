//
//  RandomUserViewController.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/4/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var randomUsersVC = [RandomUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }
    func loadData() {
        randomUsersVC = RandomUserData.getRandomUser()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let randomUserDetail = segue.destination as? RandomUserDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("segue did not work.")
        }
        randomUserDetail.randomUser = randomUsersVC[indexPath.row]
    }
    
}
extension RandomUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsersVC.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        
        let selectedRandomUser = randomUsersVC[indexPath.row]
        
        let randomUserFirstName = selectedRandomUser.name.first ?? ""
        
        let randomUserLastName = selectedRandomUser.name.last ?? ""
        
        let fullName = ("\(randomUserFirstName) \(randomUserLastName)")
        
        cell.textLabel?.text = fullName
        
        cell.detailTextLabel?.text = selectedRandomUser.email
        
//        cell.UIImage.image = UIImage.init(data: jokes)
        
        return cell
    }
}
