//
//  _66PlusOne.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/18.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class plusOne {
    static func solution(_ digits: [Int]) -> [Int]{
        var carry = 1
        var ans = digits
        var sum = 0
        for i in 0..<digits.count {
            let index = digits.count - 1 - i
            sum = (ans[index] + carry)
            ans[index] = sum % 10
            carry = sum / 10
        }
        
        if carry > 0 {
            ans.insert(carry, at: 0)
        }
        
        return ans
    }
}
