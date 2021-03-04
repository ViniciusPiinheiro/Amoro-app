//
//  MessageSelectionView.swift
//  Amoro-app
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct MessageSelectionView: View {
    
    
    var body: some View {
        List(cute) { (post) in
            HStack {
                Image(post.image)
                    //.aspectRatio(contentMode: .fill)
                    //.frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
                    .frame(width: 8)
                Text(post.text)
            }
        }
    }
}

struct MessageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MessageSelectionView()
    }
}

struct Posts: Identifiable {
    var id: String
    var image: String
    var text: String
}

let cute = [
    Posts(id: "1", image: "Icon", text: "Oi"),
    Posts(id: "2", image: "Icon", text: "Olá"),
    Posts(id: "3", image: "Icon", text: "Ohayou")
]
