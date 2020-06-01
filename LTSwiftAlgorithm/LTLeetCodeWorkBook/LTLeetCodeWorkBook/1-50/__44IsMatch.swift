//
//  _44IsMatch.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class IsMatch2 {
    class func solution(_ s: String, _ p: String) -> Bool {
        if p == s || p == "*" {
            return true
        }
        
        if p == "" || s == "" {
            return false
        }
        
        let arrS = Array(s), arr_P = Array(p) as [Character]
        var arrP = [Character]()
        arr_P.forEach { (char) in
            if arrP.last == "*", char == "*" {
                return
            } else {
                arrP.append(char)
            }
        }
        
        var dp = [[Bool]].init()
        
        for _ in 0...p.count {
            var ele = [Bool].init()
            for _ in 0...s.count {
                ele.append(false)
            }
            dp.append(ele)
        }
        dp[0][0] = true
        
        var j:Int
        for i in 1...arrP.count {
            if arrP[i - 1] == "*" {
                j = 1
                while !dp[i-1][j-1] && j < s.count + 1 {
                    j += 1
                }
                dp[i][j-1] = dp[i-1][j-1]
                while j < s.count + 1 {
                    dp[i][j] = true
                    j += 1
                }
            } else if(arrP[i - 1] == "?") {
                for j in 1...s.count {
                    dp[i][j] = dp[i-1][j-1]
                }
            } else {
                for j in 1...s.count {
                    dp[i][j] = dp[i-1][j-1] && arrP[i-1] == arrS[j-1]
                }
            }
        }
        
        return dp[arrP.count][s.count]
    }
    
    class func solution2(_ s: String, _ p: String) -> Bool {
        if s.count == 0 || p.count == 0 {return s == p || p == "*"}
        
        let arrS = Array(s), arr_P = Array(p) as [Character]
        var arrP = [Character]()
        arr_P.forEach { (char) in
            if arrP.last == "*", char == "*" {
                return
            } else {
                arrP.append(char)
            }
        }
    
        var memo:[[Bool?]] = Array.init(repeating: Array.init(repeating: nil, count: arrP.count+1), count: arrS.count+1)
    
        func _solution(from idx: Int, by pIndex: Int) -> Bool {
            if memo[idx][pIndex] != nil {
                return memo[idx][pIndex]!
            }
            if pIndex >= arrP.count && idx < arrS.count {return arrP.last == "*"}

            if idx >= s.count {return pIndex >= arrP.count || (arrP[pIndex] == "*" && pIndex == arrP.count - 1)}
            
            var result = false
            if arrP[pIndex] == "?" || (arrP[pIndex] == arrS[idx]) {
                result = _solution(from: idx + 1, by: pIndex + 1)
            } else if arrP[pIndex] == "*" {
                result = _solution(from: idx, by: pIndex + 1) || _solution(from: idx + 1, by: pIndex)
            }
            memo[idx][pIndex] = result
            return result
    }
    
        return _solution(from: 0, by: 0)
    }
}
