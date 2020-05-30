//
//  _12IntToRoman.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/9.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class IntToRoman {
    class func solution(_ num: Int) -> String {
        if num < 1 || num > 4999 {
            return ""
        }
        
        let dividers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var startIndex = 0
        for i in 0..<dividers.count {
            if num / dividers[i] > 0 {
                startIndex = i
                break
            }
        }
        
        let map = [
            1000: "M",
            900: "CM",
            500: "D",
            400: "CD",
            100: "C",
            90: "XC",
            50: "L",
            40: "XL",
            10: "X",
            9: "IX",
            5: "V",
            4: "IV",
            1: "I"
        ]
        
        var temp = num
        var s = ""
        
        for i in startIndex..<dividers.count {
            while temp >= dividers[i] {
                s.append(map[dividers[i]]!)
                temp -= dividers[i]
            }
        }
        
        return s
    }
}
