//
//  _7Reverse.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/2.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Reverse {
    class func solution(_ x: Int) -> Int {
        if x < -(1<<31) || x > (1 << 31 - 1) {
            return 0
        }
        
        var originX = x > 0 ? x : -x
        var reversedX = 0
        while originX > 0 {
            reversedX *= 10
            reversedX += originX%10
            originX /= 10
        }
        return x > 0 ? reversedX : -reversedX
    }
}


