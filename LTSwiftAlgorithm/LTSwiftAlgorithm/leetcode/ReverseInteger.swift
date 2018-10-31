//
//  ReverseInteger.swift
//  LTSwiftAlgorithm
//
//  Created by 刘涛 on 2018/10/31.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class ReverseInteger: LeetcodeSolution {
    override func solution() {
        self.reverse(1534236469)
    }
    
    func reverse(_ x: Int) -> Int {
        var residueValue = x > 0 ? x : -x
        var result = 0
        while residueValue > 0 {
            result = result * 10 + residueValue % 10
            residueValue /= 10
        }
        result = x > 0 ? result : -result
        if (result > (1 << 31) - 1 || result < -(1 << 31)) {
            return 0
        } else {
            return result
        }
    }
}
