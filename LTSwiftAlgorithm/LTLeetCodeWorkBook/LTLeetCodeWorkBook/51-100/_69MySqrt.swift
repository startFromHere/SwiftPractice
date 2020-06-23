//
//  _69MySqrt.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/21.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MySqrt {
    static func solution(_ x: Int) -> Int {
        if x < 1 {
            return 0
        }
        
        var tempValue: Double = Double(x) / 2.0
        while true {
            tempValue = (tempValue + Double(x)/tempValue) / 2
            var dif: Double = tempValue * tempValue - Double(x)
            if dif < 0 {
                dif = -dif
            }
            if dif < 0.1 {
                return Int(tempValue)
                break
            }
        }
        
        return 0
    }
}
