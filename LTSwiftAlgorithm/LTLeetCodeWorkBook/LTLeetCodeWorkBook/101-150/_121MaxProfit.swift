//
//  _121MaxProfit.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/3.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MaxProfit {
    static func solution(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        
        var l = 0, i = 1
        var ans = 0
        var lValue = prices[l]
        var currentValue = lValue
        while i < prices.count {
            currentValue = prices[i]
            if currentValue <= lValue {
                lValue = currentValue
            } else {
                ans = max(ans, currentValue - lValue)
            }
            i += 1
        }
        return ans
    }
}
