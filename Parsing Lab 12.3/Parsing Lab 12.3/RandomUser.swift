//
//  RandomUser.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/4/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import Foundation

struct RandomUserData: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable {
    let name: UserName
    let location: Address
    let phone: String
    let dob: DOB
    let email: String
    let picture: Picture
    
}

struct UserName: Codable {
    var title: String
    var first: String
    var last: String
}
               
struct Address: Codable {
    var street: Street
    var city: String
    var country: String
    
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct DOB: Codable {
    let date: String
}

struct Picture: Codable {
    let medium: String
}

extension RandomUserData {
    static func getRandomUser() -> [RandomUser] {
        var userExtension = [RandomUser]()

        guard let fileURL = Bundle.main.url(forResource: "RandomUser", withExtension: "json") else {
            fatalError("there is an issue with the url")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(RandomUserData.self, from: data)
            userExtension = userData.results
        } catch {
            print("there is an issue \(error)")
        }
        return userExtension
    }
}
