//
//  RomanToInteger.swift
//  LTSwiftAlgorithm
//
//  Created by 刘涛 on 2018/11/1.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class RomanToInteger: LeetcodeSolution {
    override func solution() {
        let yesOrNot = self.romanToInt("MCMXCIV")
    }
    
    func romanToInt(_ s: String) -> Int {
        let dic = ["I":1,
                   "V":5,
                   "X":10,
                   "L":50,
                   "C":100,
                   "D":500,
                   "M":1000]
        
        var lastCharacter = ""
        var result = 0
        for character in s {
            guard let intValue = dic[String(character)] else {
                return 0
            }
            
            if !lastCharacter.isEmpty && intValue > dic[String(lastCharacter)]!{
                result += intValue - 2 * dic[String(lastCharacter)]!
            } else {
                result += intValue
            }
            
            lastCharacter = String(character)
        }
        
        return result
    }
}
