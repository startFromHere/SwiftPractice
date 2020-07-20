//
//  _201RangeBitwiseAnd.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/9.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RangeBitwiseAnd {
    static func solution(_ m: Int, _ n: Int) -> Int {
        
        if (m > n) {
            return solution(n, m)
        }
        
        if m == n {
            return m
        }
        var myM = m, myN = n
        var count = 0
        while myM != myN {
            myM >>= 1
            myN >>= 1
            count += 1
        }
        
        while count > 0 {
            myM <<= 1
        }
        
        return myM
        
    }
}
