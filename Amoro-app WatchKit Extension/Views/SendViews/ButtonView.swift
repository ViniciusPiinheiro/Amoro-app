//
//  ButtonView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 08/03/21.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 130, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundColor(Color("Secundary Button"))
            Text("Fechar")
                .padding()
        }    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
