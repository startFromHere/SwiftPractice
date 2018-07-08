//
//  LTPockCardsDesk.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/7.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

struct LTPlayingCardsDesk
{
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4Random)
        } else {
            return nil
        }
    }
    
}
