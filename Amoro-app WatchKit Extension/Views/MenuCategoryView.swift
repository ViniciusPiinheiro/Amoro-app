//
//  MenuCategoryView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct MenuCategoryView: View {
    
    let cute = Categories.cuteOption
    let comic = Categories.comicOption
    let poke = Categories.pokeOption
    let hot = Categories.hotOption
    
    var body: some View {
        
        HStack {
            VStack {
                CategoryFrame(categoryName: cute.text, iconName: cute.image)
                CategoryFrame(categoryName: poke.text, iconName: poke.image)
            }
            VStack {
                CategoryFrame(categoryName: hot.text, iconName: hot.image)
                CategoryFrame(categoryName: comic.text, iconName: comic.image)
            }
        }
    }
    
}

struct MenuCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategoryView()
    }
}
