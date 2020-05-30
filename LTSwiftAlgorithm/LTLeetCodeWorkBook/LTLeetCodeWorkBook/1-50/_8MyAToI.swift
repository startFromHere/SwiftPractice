//
//  _8MyAToI.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/7.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MyAToI {
    class func solution(_ str: String) -> Int {
        var result = 0
        var hasFindEffectiveCharacter = false
        var isNegative = false
        let arr = Array(str)
        for c in arr {
            if c == " " {
                if hasFindEffectiveCharacter {
                    return 0
                }
                continue
            }
            
            if !hasFindEffectiveCharacter {
                hasFindEffectiveCharacter = true
                if !(c == "+" || c == "-" || (c >= "0" && c <= "9")) {
                    return 0
                } else if c == "-" {
                    isNegative = true
                    continue
                } else if c == "+" {
                    continue
                }
            }
            
            if c >= "0" && c <= "9" {
                result = result * 10 + Int(String(c))!
                if result > (1<<31) - 1 {
                    return isNegative ? -(1<<31) : (1<<31 - 1)
                }
            } else {
                return isNegative ? -result : result
            }
        }
        
        if isNegative {
            result = -result
        }
        
        return result
    }
}
