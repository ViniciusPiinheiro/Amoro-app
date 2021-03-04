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
            HStack {
                Circle()
                    .frame(width: 20, height: 20)
                Text(post.text)
            }
            .listRowBackground(Color.red)
        }
        
    }
}

struct MessageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MessageSelectionView(categorySelected: Posts.comic)
    }
}
