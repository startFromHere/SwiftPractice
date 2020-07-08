//
//  _122MaxProfit2.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/7.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MaxProfit2 {
    static func solution(_ prices: [Int]) -> Int {
        var ans = 0
        if prices.count < 2 {
            return 0
        }
        var pre = prices[0]
        var cur = pre
        for i in 1..<prices.count {
            cur = prices[i]
            if cur > pre{
               ans += cur - pre
            }
            pre = cur
        }
        return ans
    }
    
    static func solution2(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        var ans = 0
        var smallerValue = prices[0]
        var biggerValue = prices[0]
        
        
        for i in 1..<prices.count {
            let price = prices[i]
            if price < biggerValue {
                ans += biggerValue - smallerValue
                smallerValue = price
            } else if price < smallerValue {
                smallerValue = price
            }
            biggerValue = price
            
        }
        
        if biggerValue > smallerValue {
            ans += biggerValue - smallerValue
        }
        
        return ans
    }
}
