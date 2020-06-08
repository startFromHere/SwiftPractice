//
//  _50MyPow.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/6.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class myPow {
    static func solution(_ x: Double, _ n: Int) -> Double {
        
        var memo:[Int: Double] = [0: 1.0, 1: x]
        
        func _solution(_ _x: Double, _ _n: Int) -> Double {
            
            if _x == 0 {
                return n == 0 ? 1 : 0
            }
            
            if _n == 0 {
                return 1
            }
            
            if _n < 0 {
                return 1 / _solution(_x, -n)
            }
            
            if memo[_n] != nil {
                return memo[_n]!
            } else {
                memo[_n] = (_solution(_x, _n>>1)) * (_solution(_x, _n-(_n>>1)))
                return memo[_n]!
            }
        }
        
        return _solution(x, n)
    }
}
