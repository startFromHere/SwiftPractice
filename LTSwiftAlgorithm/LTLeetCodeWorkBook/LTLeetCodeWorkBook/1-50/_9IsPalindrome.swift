//
//  _9IsPalindrome.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/3.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class IsPalindrome {
    class func solution(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var reversedValue = 0
        var dividedX = x
        while dividedX > 0 {
            reversedValue  = reversedValue * 10 + dividedX % 10
            dividedX /= 10
        }
        
        if reversedValue == x {
            return true
        }
        
        return false
    }
}
