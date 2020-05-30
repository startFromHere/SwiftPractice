//
//  _29Divide.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/14.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Divide {
    class func solution(_ dividend: Int, _ divisor: Int) -> Int {
        if divisor == 0 {
            return 0
        }
        var isNegative = false
        if (dividend ^ divisor) < 0 {
            isNegative = true
        }
        
        var abs_dividend = abs(dividend)
        let abs_divisor = abs(divisor)
        var result = 0
        for i in stride(from: 31, to: -1, by: -1) {
            if (abs_dividend>>i) >= abs_divisor {
                result += (1 << i)
                abs_dividend -= (abs_divisor << i)
            }
        }
        
        result = isNegative ? -result : result
        
        return min(1<<31 - 1, max(-(1<<31), result))
    }
}
