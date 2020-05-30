//
//  _10IsMatch.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/8.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class IsMatch{
    static var memo:[[Bool?]]!
    
    //正则判断
    class func _isMatch(_ i:Int, _ j:Int, _ s: String, _ p: String) -> Bool{
        if memo[i][j] != nil {
            return memo[i][j] == true
        }
        
        var value = false
        if j == p.count {
            value = (i == s.count)
        } else {
            let isFirstMatch = (i<s.count && (Array(s)[i] == Array(p)[j] || Array(p)[j] == "."))
            
            //动态规划
            if j+1 < p.count && Array(p)[j+1] == "*" {
                value = _isMatch(i, j+2, s, p) || (isFirstMatch && _isMatch(i+1, j, s, p))
            } else {
                value = isFirstMatch && _isMatch(i+1, j+1, s, p)
            }
            
            memo[i][j] = value ? true : false
        }
        
        return value
    }
    
    
    class func solution(_ s: String, _ p: String) -> Bool{
        memo = Array.init(repeating: Array(repeating: nil, count: p.count+1), count: s.count+1)
        return _isMatch(0, 0, s, p)
    }
    
}
