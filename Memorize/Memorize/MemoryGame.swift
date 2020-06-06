//
//  MemoryGame.swift
//  Memorize
//
//  Created by 刘涛 on 2020/6/6.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards:Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card.init(content: cardContentFactory(pairIndex), id:pairIndex * 2))
            cards.append(Card.init(content: cardContentFactory(pairIndex), id:pairIndex * 2 + 1))
        }
    }
    
    mutating func choose(card: Card) {
        print("card choosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceup = !self.cards[chosenIndex].isFaceup
    }
    
    func index(of card:Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1 // TODO: bogus!
    }
    
    struct Card: Identifiable {
        var isFaceup: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id:Int
    }
}
