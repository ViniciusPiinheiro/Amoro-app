//
//  MessageSelectionView.swift
//  Amoro-app
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct MessageSelectionView: View {
    var categorySelected = [Posts]()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<categorySelected.count) { i in
                    NavigationLink(destination: ContentView(messageImage: "Sample", messageText: categorySelected[i].text)) {
                        rowListView(colorRow: categorySelected[i].id, text: categorySelected[i].text)
                    }
                }
            }
            
        }
        
        .navigationTitle(categorySelected[0].title)
    }
    
}

struct MessageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MessageSelectionView(categorySelected: Posts.comic)
    }
}
