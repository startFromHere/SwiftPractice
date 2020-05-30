//
//  _13RomanToInt.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/3.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RomanToInt {
    class func solution(_ s: String) -> Int {
//        let characterDic = [
//            "I": 1,
//            "V": 5,
//            "X": 10,
//            "L": 50,
//            "C": 100,
//            "D": 500,
//            "M": 1000
//        ]
        
//        func valueFactor(of currentCharacter:Character, post postCharacter:Character) -> Int {
//
//            return
//        }
        
        let arr = Array(s)
        var v = 0
        var c:Character
        for i in stride(from: arr.count - 1, to: -1, by: -1) {
            c = arr[i]
            switch c {
            case "I": v += v > 5 ? 1 : -1
            case "V": v += 5
            case "X": v += v > 50 ? 10 : -10
            case "L": v += 50
            case "C": v += v > 500 ? 100 : -100
            case "D": v += 500
            case "M": v += 1000
            default:
                return 0
            }
        }
        
        return v
    }
}
