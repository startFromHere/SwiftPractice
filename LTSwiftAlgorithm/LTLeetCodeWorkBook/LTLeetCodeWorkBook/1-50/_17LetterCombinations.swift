//
//  _17LetterCombinations.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/10.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class LetterCombinations {
    class func solution(_ digits: String) -> [String] {
        if digits.count <= 0 {return []}
        let map:[String: String] = [
            "2" : "abc",
            "3" : "def",
            "4" : "ghi",
            "5" : "jkl",
            "6" : "mno",
            "7" : "pqrs",
            "8" : "tuv",
            "9" : "wxyz"
        ]
        
        let currentCharStr = String(digits.first!)
        let charArr = Array(map[currentCharStr]!).map {String($0)}
        if digits.count == 1 {
            return charArr
        } else {
            let subString = digits[digits.index(digits.startIndex, offsetBy: 1)..<digits.endIndex]
            let postArr = solution(String(subString))
            var arr = [String]()
            
            charArr.forEach { (s1) in
                postArr.forEach { (s) in
                    arr.append(s1+s)
                }
            }
            return arr
        }
    }
}
