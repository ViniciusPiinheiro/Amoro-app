//
//  BigAlertView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct PairingView: View {
    var body: some View {
        GeometryReader { proxy in
            if proxy.size.width > 324/2.0 { // 40mm watch resolution in points
                VStack {
                    Image("Sample")
                        .padding(.top)
                    Text("Você e seu amor")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 17))
                    Text("agora estão")
                        .font(.system(size: 17))
                    Text("conectados")
                        .bold()
                        .font(.system(size: 17))
                    NavigationLink(destination: MenuCategoryView()) {
                        ButtonView()

                    }
                    .padding(.top, 20)
                    .frame(width: 100, height: 18, alignment: .center)
                }
                
            } else {
                ScrollView {
                    VStack {
                        Image("Sample")
                            .padding(.top)
                        Text("Você e seu amor")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 17))
                        Text("agora estão")
                            .font(.system(size: 17))
                        Text("conectados")
                            .bold()
                            .font(.system(size: 17))
                        NavigationLink(destination: MenuCategoryView()) {
                            ButtonView()
                        }
                        .padding(.top, 20)
                        .frame(width: 100, height: 22, alignment:.center)
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct PairingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PairingView()
            PairingView()
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
