//
//  CategoryFrame.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

//
//  CategoryFrame.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct CategoryFramePink: View {
    
    let categoryName:String
    let iconName:String
    
    var body: some View {
        
        ZStack {
            VStack {
                Text(categoryName)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.purple)
                    .padding(.trailing, categoryName == "Hot" ? 30 : 24)
                Image(iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 35, alignment: .center)
                    .padding(.leading, 20)
            }
            .frame(width: 75, height: 75)
            .background(Color("Button 2"))
            .cornerRadius(12)
        }
    }
}


struct CategoryFramePink_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFramePink(categoryName: "Test", iconName: "Sample")
    }
}



