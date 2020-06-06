//
//  ContentView.swift
//  Memorize
//
//  Created by 刘涛 on 2020/5/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
                .font(Font.largeTitle)
                .padding(5)
                .foregroundColor(Color.orange)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceup {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius:10.0).fill()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
