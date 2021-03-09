//
//  ContentView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct StartView: View {
    
    @State private var name: String = "0000"
    @State private var room = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Adicione o código do seu amor")
                    .multilineTextAlignment(.leading)
                    .font(.custom("FontsFree-Net-SF-Compact-Rounded-Medium", size: 30))
                    
                
                Spacer()
                    .frame(height: 12)
                NavigationLink(destination: PairingView()) {
                    TextField("Enter your name", text: $name)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())

                Spacer()
                    .frame(height: 12)
                Divider()
                Spacer()
                    .frame(height: 12)
                HStack {
                    Text("Seu código é")
                        .font(.custom("SFCompactRounded", size: 14))
                        .foregroundColor(Color("Tertiary Text"))
                    Text(String(room))
                        //.font(.custom("SF-Compact-Rounded-Bold", size: 14))
                        .bold()
                }
            }
            .onAppear(perform: {
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
