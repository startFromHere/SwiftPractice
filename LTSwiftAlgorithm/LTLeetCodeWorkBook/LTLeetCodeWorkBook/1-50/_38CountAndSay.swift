//
//  _38CountAndSay.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/18.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class CountAndSay{
    class func solution(_ n: Int) -> String {
        if n == 0 {return ""}
        if n == 1 {return "1"}
        
        func describe(_ str:String) -> String {
            guard var currentChar = str.first else {
                return ""
            }
            var ans = ""
            let arr = Array(str)
            var count = 0
            for i in 0..<arr.count {
                if currentChar != arr[i] {
                    ans.append("\(count)\(String(currentChar))")
                    currentChar = arr[i]
                    count = 1
                } else {
                    count += 1
                }
            }
            if count > 0 {
                ans.append("\(count)\(String(arr[str.count-1]))")
            }
            return ans
        }
        
        return describe(solution(n-1))
    }
}
