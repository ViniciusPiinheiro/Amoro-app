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
                CategoryFramePurple(categoryName: cute.text, iconName: cute.image)
                CategoryFramePink(categoryName: poke.text, iconName: poke.image)
            }
            VStack {
                CategoryFramePink(categoryName: hot.text, iconName: hot.image)
                CategoryFramePurple(categoryName: comic.text, iconName: comic.image)
            }
        }

        .navigationBarBackButtonHidden(true)
        .padding(.top, 20)
        

        
        
    }
    
}

struct MenuCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategoryView()
    }
}
