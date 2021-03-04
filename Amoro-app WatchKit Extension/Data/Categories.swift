//
//  Categories.swift
//  Amoro-app WatchKit Extension
//
//  Created by andrea dantas on 03/03/21.
//

import Foundation

class Categories {
    var image:String
    var text:String
    init(image: String, text: String) {
        self.image = image
        self.text = text
    }
}

extension Categories {
    static let cuteOption = Categories(image: "Sample", text: "Cute")
    static let comicOption = Categories(image: "Sample", text: "Comic")
    static let pokeOption = Categories(image: "Sample", text: "Poke")
    static let hotOption = Categories(image: "Sample", text: "Hot")
}

