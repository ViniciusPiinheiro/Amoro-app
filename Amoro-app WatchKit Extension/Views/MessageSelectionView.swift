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
        List(categorySelected) { (post) in
            NavigationLink(destination: ContentView(messageImage: "Sample", messageText: post.text)) {
                HStack {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor((post.id  % 2 == 0) ? Color(.red) : Color(.purple))
                        .listRowBackground((post.id  % 2 == 0) ? (Color.red) : (Color.purple))
                    Text(post.text)
                        .foregroundColor((post.id  % 2 == 0) ? Color(.white) : Color(.purple))
                        .listRowBackground((post.id  % 2 == 0) ? (Color.red) : (Color.purple))
                }
            }
        }
        
    }
    
}

struct MessageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MessageSelectionView(categorySelected: Posts.comic)
    }
}
