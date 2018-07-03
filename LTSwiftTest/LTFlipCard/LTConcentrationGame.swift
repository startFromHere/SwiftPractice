//
//  LTConcentrationGame.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/2.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class LTConcentrationGame {
    
    var cards = [LTFlipCard]()
    var indexOfTheOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfTheOnlyFaceUpCard,matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    indexOfTheOnlyFaceUpCard = nil
                }
                cards[index].isFaceUp = true
                indexOfTheOnlyFaceUpCard = nil
            } else {
                for flipIndex in cards.indices {
                    cards[flipIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfTheOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = LTFlipCard()
            test(card)
            cards += [card,card]
        }
        cards = cards.sorted(){ _,_ in (UInt32)(arc4random()%2) == 0 }
    }
    
    func test(_ card:LTFlipCard) {

    }
    
}
