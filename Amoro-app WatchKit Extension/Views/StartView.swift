//
//  ContentView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct StartView: View {
    
    @State private var name: String = "0000"
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Adicione o código do seu amor")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 30))
                
                Spacer()
                    .frame(height: 12)
                NavigationLink(destination: PairingFeedbackView()) {
                    TextField("Enter your name", text: $name)
                }
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
            .onAppear(perform: {
                var room = 0
                let randomNumber = Int.random(in: 1...10000)
                room = randomNumber
                let coupleRoom = CoupleRoom(roomNumber: room)
                coupleRoom.createRecord { (error) in
                    if error != nil {
                        print("Não foi")
                    } else {
                        print("foi")
    
                    }
                }
            })
            
            
        }
    }
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
