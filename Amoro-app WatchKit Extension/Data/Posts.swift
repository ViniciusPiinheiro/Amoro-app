//
//  Posts.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import Foundation
import SwiftUI

class Posts: Identifiable {
    var id: Int
    var text:String
    init(id:Int, text:String) {
        self.id = id
        self.text = text
    }
    
    
    static let cute = [
        Posts(id: 1, text: "Eu te amo, bebê"),
        Posts(id: 2, text: "Você é meu neném"),
        Posts(id: 3, text: "Tô pensando em você"),
        Posts(id: 4, text: "Tô com saudades"),
        Posts(id: 5, text: "Você alegra meu coração"),
        Posts(id: 6, text: "Você é muito importante"),
        Posts(id: 7, text: "Ohayou"),
        Posts(id: 8, text: "Ohayou")
    ]
    
    static let comic = [
        Posts(id: 1, text: "Se você abrir a boca sai miau"),
        Posts(id: 2, text: "Você é meu neném"),
        Posts(id: 3, text: "Tô pensando em você"),
        Posts(id: 4, text: "Tô com saudades"),
        Posts(id: 5, text: "Você alegra meu coração"),
        Posts(id: 6, text: "Você é muito importante"),
        Posts(id: 7, text: "Ohayou"),
        Posts(id: 8, text: "Ohayou")
    ]
    
    static let poke = [
        Posts(id: 1, text: "Vamos nos ver?"),
        Posts(id: 2, text: "Vamos comer?"),
        Posts(id: 3, text: "Deixa eu cuidar de ti"),
        Posts(id: 4, text: "Tô com saudades"),
        Posts(id: 5, text: "Você alegra meu coração"),
        Posts(id: 6, text: "Você é muito importante"),
        Posts(id: 7, text: "Ohayou"),
        Posts(id: 8, text: "Ohayou")
    ]
    
    static let hot = [
        Posts(id: 1, text: "Vamos ali testar um negócio?"),
        Posts(id: 2, text: "Ei, psiu..."),
        Posts(id: 3, text: "Vamos perder o juízo juntos"),
        Posts(id: 4, text: "Tô com saudades"),
        Posts(id: 5, text: "Você alegra meu coração"),
        Posts(id: 6, text: "Você é muito importante"),
        Posts(id: 7, text: "Ohayou"),
        Posts(id: 8, text: "Ohayou")
    ]
    
}
