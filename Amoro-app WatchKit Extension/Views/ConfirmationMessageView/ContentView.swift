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
    
    @State var messageImage:String
    var messageText: String
    @State private var iconNumber = 1
    @State private var icons = ["Sample", "beatIcon", "cuteIcon", "funnyIcon", "hotIcon"]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        print("Edit button was tapped")
                        iconNumber -= 1
                        self.messageImage = icons[iconNumber-1]
                    }) {
                        HStack(spacing: 8) {
                            Image("buttonLeft")
                                .padding(.leading, 16)
                        }
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    .cornerRadius(50)
                    .frame(width: 35, height: 35)
                    .padding(.leading)
                    .opacity(iconNumber == 1 ? 0.0 : 1.0 )

                    ZStack {
                        Image("principalCircle")
                            .resizable()
                            .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Image(messageImage)
                            .resizable()
                            .frame(width: 48.5, height: 40.75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 20)
                            
                    }
                        .padding()
                        .padding(.bottom, -18)
                    Button(action: {
                        print("Edit button was tapped")
                        iconNumber += 1
                        self.messageImage = icons[iconNumber-1]
                    }) {
                        HStack(spacing: 8) {
                            Image("buttonRight")
                                .padding(.trailing, 16)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .cornerRadius(50)
                    .frame(width: 35, height: 35)
                    .padding(.trailing)
                    .opacity(iconNumber < icons.count ? 1.0 : 0.0 )
                }
                .padding()
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 164, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("Box Label"))
                    Text(messageText)
                        .padding()
                }
                .padding(.trailing, 60)
                .padding(.leading, 60)
                Spacer()
                    .frame(height: 12)
                NavigationLink(destination: SendView()) {
                    Text("Enviar")
                        .foregroundColor(Color("Primary Text - Dark"))
                }
                .background(Color("Title | Primary Button"))
                .cornerRadius(15)
                .padding(.trailing, 60)
                .padding(.leading, 60)
            }
        }
        .navigationTitle("Mensagem")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(messageImage: "Sample", messageText: "Se você abrir a boca sai miau")
                .previewDevice("Apple Watch Series 6 - 40mm")
            ContentView(messageImage: "Sample", messageText: "Se você abrir a boca sai miau")
                .previewDevice("Apple Watch Series 6 - 44mm")
        }
    }
}
