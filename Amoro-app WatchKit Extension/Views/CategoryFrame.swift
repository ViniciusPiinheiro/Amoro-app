//
//  CategoryFrame.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct CategoryFrame: View {
    
    let categoryName:String
    let iconName:String
    
    var body: some View {
        
        
        RoundedRectangle(cornerRadius: 12)
            .frame(width: 78, height: 78)
            .overlay(VStack {
                Text(categoryName)
                    .foregroundColor(.white)
                    .padding()
                Image(systemName: iconName)
                    .padding()
                    .foregroundColor(.green)
            })
        
            .foregroundColor(.purple)
    }
}

struct CategoryFrame_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFrame(categoryName: "Test", iconName: "Sample.PNG")
    }
}
