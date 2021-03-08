//
//  Categories.swift
//  Amoro-app WatchKit Extension
//
//  Created by andrea dantas on 03/03/21.
//

import Foundation
import CloudKit

class Categories {
    var image: String
    var text: String
    
    init(image: String, text: String) {
        self.image = image
        self.text = text
    }
    
}


extension Categories {
    static let cuteOption = Categories(image: "cuteIcon", text: "Cute")
    static let funnyOption = Categories(image: "funnyIcon", text: "Funny")
    static let beatIcon = Categories(image: "beatIcon", text: "Beat")
    static let hotOption = Categories(image: "hotIcon", text: "Hot")
}


