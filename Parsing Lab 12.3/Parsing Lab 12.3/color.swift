//
//  color.swift
//  Parsing Lab 12.3
//
//  Created by Margiett Gil on 12/4/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import Foundation

struct ColorBrian: Codable {
    let colors: [Color]
}
 
struct Color: Codable {
    var hex: Hex
    var name: ColorName
    var rgb: RGB
}
struct Hex: Codable {
    var value: String
}

struct ColorName: Codable {
    var value: String
}

struct RGB: Codable {
    var r: Double
    var g: Double
    var b: Double
}

extension Color {
    static func getColors() -> [Color]{
        
        var colorArrInfo = [Color]()
        
        guard let fileURL = Bundle.main.url(forResource: "Color", withExtension: "json") else{
            fatalError("unable to get the color data ")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let colorData = try JSONDecoder().decode(ColorBrian.self, from: data)
            
            colorArrInfo = colorData.colors
            
        } catch {
            fatalError("\(error)")
        }
        return colorArrInfo
    }
}
