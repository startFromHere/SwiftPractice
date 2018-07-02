//
//  LTFlipCard.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/2.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation
import UIKit

struct LTFlipCard:UIButton {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier ()->Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init () {
        self.identifier = LTFlipCard.getUniqueIdentifier()
    }
}
