//
//  rowListView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 08/03/21.
//

import SwiftUI

struct rowListView: View {
    var colorRow:Int
    var text:String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 164, height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor((colorRow % 2 == 0) ? Color("Button 2") : Color("Button 1"))
            HStack {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor((colorRow % 2 == 0) ? Color("Primary Text - Dark") : Color("Button 2"))
                    .padding(.leading, 18)

                Text(text)
//                    .font(.custom("SFCompactRounded", size: 17))
                    .foregroundColor((colorRow % 2 == 0) ? Color("Primary Text - Dark") : Color(.white))
                    .listRowBackground((colorRow  % 2 == 0) ? (Color.red) : (Color.purple))
                    .padding()
            }
        }
        .padding()
    }
}

struct rowListView_Previews: PreviewProvider {
    static var previews: some View {
        rowListView(colorRow: 1, text: "Vamos ali testar um negócio?")
    }
}
