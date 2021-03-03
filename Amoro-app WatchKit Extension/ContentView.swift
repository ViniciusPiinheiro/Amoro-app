//
//  ContentView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = "0000"
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Text("Adicione o código do seu amor")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 30))
                    
                Spacer()
                    .frame(height: 12)
                TextField("Enter your name", text: $name)
                Spacer()
                    .frame(height: 12)
                Divider()
                Spacer()
                    .frame(height: 12)
                HStack {
                    Text("Seu código é")
                    Text("00000")
                        .bold()
                }
            }
            
            
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
