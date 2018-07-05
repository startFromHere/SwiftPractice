//
//  LTFlipCard.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/2.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation
import UIKit

struct LTFlipCard:Hashable {
    
    var hashValue:Int {
        return identifier
    }
    
    static func ==(lhs:LTFlipCard, rhs:LTFlipCard) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    
    static var identifierFactory = -1
    static func getUniqueIdentifier ()->Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init () {
        self.identifier = LTFlipCard.getUniqueIdentifier()
    }
}
