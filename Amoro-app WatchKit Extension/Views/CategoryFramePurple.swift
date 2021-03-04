//
//  CategoryFramePurple.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct CategoryFramePurple: View {
    let categoryName:String
    let iconName:String
    
    var body: some View {
        
        ZStack {
            VStack {
                Text(categoryName)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.trailing, 24)
                Image(iconName)
                    .resizable()
                    .frame(width: 40, height: 35, alignment: .center)
                    .cornerRadius(25)
                    .padding(.leading, 20)
            }
            .frame(width: 75, height: 75)
            .background(Color.purple)
            .cornerRadius(12)
        }
    }
}

struct CategoryFramePurple_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFramePurple(categoryName: "Test", iconName: "Sample")
    }
}
