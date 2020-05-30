//
//  _5LongestPalindrome.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/6.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class longestPalindrome {
    class func solution(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }
        
        let arr = Array(s)
        var range = (0, 0)
        func longestPalindromeExpand(from index:Int) -> String{
            var l = 0
            var r = index + 1
            
            //1.以当前的index为中心展开
            l = index - 1
            var range1 = (index, index)
            while l >= 0 && r < arr.count {
                if arr[l] == arr[r] {
                    range1 = (l,r)
                    l -= 1
                    r += 1
                } else {
                    break
                }
            }
            
            //2.以当前index和下一个index中点展开
            l = index
            r = index + 1
            var range2 = (index, index)
            while l >= 0 && r < arr.count {
                if arr[l] == arr[r] {
                    range2 = (l,r)
                    l -= 1
                    r += 1
                } else {
                    break
                }
            }
            
            range = range1.1 >= range2.1 ? range1 : range2
            
            let startIndex = s.index(s.startIndex, offsetBy: range.0)
            let endIndex = s.index(s.startIndex, offsetBy: range.1)
            
            return String(s[startIndex...endIndex])
        }
        
        
        var result = String(s.first ?? Character(""))
        var temp = result
        
        for i in 0..<arr.count {
            temp = longestPalindromeExpand(from: i)
            if temp.count > result.count {
                result = temp
            }
        }
        
        
        return result
    }
}
