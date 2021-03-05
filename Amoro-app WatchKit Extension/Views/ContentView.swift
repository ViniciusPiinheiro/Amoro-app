//
//  ContentView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI
import UIKit
import WatchKit

struct ContentView: View {
    
    var messageImage:String
    var messageText: String
    
    var body: some View {
        ScrollView {
            VStack {
                Image(messageImage)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 164, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                    Text(messageText)
                }
                NavigationLink(destination: SendFeedbackView()) {
                    Text("Enviar")
                        .foregroundColor(.purple)
                }
                .background(Color.pink)
                .cornerRadius(15)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(messageImage: "Sample", messageText: "Saudades")
    }
}
