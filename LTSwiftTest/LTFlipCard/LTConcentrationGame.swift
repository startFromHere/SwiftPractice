//
//  LTConcentrationGame.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/2.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class LTConcentrationGame {
    
    private(set) var cards = [LTFlipCard]()
    private var indexOfTheOnlyFaceUpCard: Int?{
        get {
            return cards.indices.filter {cards[$0].isFaceUp}.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index),"Concentration.chooseCard(at:\(index)):Choosen index out of range")
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfTheOnlyFaceUpCard,matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
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

extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
