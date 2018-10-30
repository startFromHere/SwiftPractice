//
//  LongestPalindromicSubstring.swift
//  LTSwiftAlgorithm
//
//  Created by 移动支付－刘涛 on 2018/10/29.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class LongestPalindromicSubstring: LeetcodeSolution {
    override func solution() {
        let s = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
        let result = longestPalindrome(s)
        print("result:\(result)")
    }
    
    var maxLength = 0
    var startIndex = 0
    
    func longestPalindrome(_ s: String) -> String {
        
        if s.count < 2 {
            return s
        }
        
        let characters = Array(s)
        for i in 0..<s.count-1 {
            checkPalindrome(characters, lowerIndex: i, higherIndex: i)
            checkPalindrome(characters, lowerIndex: i, higherIndex: i+1)
        }
        
        return String(s[String.Index(encodedOffset: startIndex)...String.Index(encodedOffset: startIndex+maxLength)])
    }
    
    func checkPalindrome(_ arr:Array<Character>, lowerIndex lowIndex:Int, higherIndex highIndex:Int){
        var l = lowIndex, h = highIndex
        while l >= 0 && h<arr.count && arr[l] == arr[h] {
            l -= 1
            h += 1
        }
        if (h - l - 2 > maxLength) {
            startIndex = l + 1
            maxLength = h - startIndex - 1
        }
    }
    
    
}
