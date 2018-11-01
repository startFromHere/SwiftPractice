//
//  PalindromeNumber.swift
//  LTSwiftAlgorithm
//
//  Created by 刘涛 on 2018/11/1.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class PalindromeNumber: LeetcodeSolution {
    override func solution() {
        let yesOrNot = self.isPalindrome(1534236469)
    }
    
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x == 0{
            return true
        }
        
        var reverseNum = 0
        var originNum = x
        while originNum > 0 {
            reverseNum = reverseNum * 10 + originNum % 10
            originNum /= 10
        }
        
        if reverseNum == x {
            return true
        } else {
            return false
        }
    }
}
