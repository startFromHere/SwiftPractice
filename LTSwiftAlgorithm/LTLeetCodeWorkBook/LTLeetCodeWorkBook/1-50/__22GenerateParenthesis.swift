//
//  _22GenerateParenthesis.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/12.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class GenerateParenthesis {
    class func solution(_ n: Int) -> [String] {
        var dp:[[String]?] = Array.init(repeating: nil, count: n+1)
        
        func _solution(_ n: Int) -> [String] {
            if n == 0 {return [""]}
            if dp[n] != nil {
                return dp[n]!
            } else {
                var arr = [String]()
                for i in 0..<n {
                    if dp[i] == nil {
                        dp[i] = _solution(i)
                    }
                    let j = n-1-i
                    if dp[j] == nil {
                        dp[j] = _solution(j)
                    }
                    for left in dp[i]! {
                        for right in dp[j]! {
                           arr.append("(\(left))\(right)")
                        }
                    }
                    dp[n] = arr
                }
            }
            
            return dp[n]!
        }
        
        return _solution(n)
    }
}
