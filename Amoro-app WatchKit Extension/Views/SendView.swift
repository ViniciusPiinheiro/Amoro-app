//
//  SendView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct SendView: View {
    var body: some View {
        GeometryReader { proxy in
            if proxy.size.width > 324/2.0 { // 40mm watch resolution in points
                VStack {
                    Image("Sample")
                    Text("Sua Mensagem")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 17))
                    HStack {
                        Text("enviada")
                            .bold()
                            .font(.system(size: 17))
                        Text("para o seu")
                            .font(.system(size: 17))
                    }
                    Text("amor")
                        .font(.system(size: 17))
                    NavigationLink(destination: MenuCategoryView()) {
                        Text("dismiss")
                    }
                    .padding(.top, 20)
                    .frame(width: 100, height: 25, alignment: .center)
                }
                
            } else {
                ScrollView {
                    VStack {
                        Image("Sample")
                        Text("Sua Mensagem")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 17))
                        HStack {
                            Text("enviada")
                                .bold()
                                .font(.system(size: 17))
                            Text("para o seu")
                                .font(.system(size: 17))
                        }
                        Text("amor")
                            .font(.system(size: 17))
                        NavigationLink(destination: MenuCategoryView()) {
                            Text("dismiss")
                        }
                        .padding(.top, 20)
                        .frame(width: 100, height: 25, alignment:.center)
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
