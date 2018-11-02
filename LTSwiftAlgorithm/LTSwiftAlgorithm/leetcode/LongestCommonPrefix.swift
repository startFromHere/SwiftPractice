//
//  LongestCommonPrefix.swift
//  LTSwiftAlgorithm
//
//  Created by 移动支付－刘涛 on 2018/11/2.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class LongestCommonPrefix: LeetcodeSolution {
    override func solution() {
        let yesOrNot = longestCommonPrefix(["1234","1234","1234"])
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        var longestPrefix = ""
        
        var shortestLen = -1
        for str in strs {
            if (shortestLen == -1 || shortestLen > str.count) {
               shortestLen = str.count
            }
        }
        
        var tempStoredCharacter:String
        var currentCharacterOfStr:String
        for i in 0..<shortestLen {
            tempStoredCharacter = String((strs[0])[String.Index(encodedOffset: i)...String.Index(encodedOffset: i)])
            for str in strs {
                currentCharacterOfStr = String(str[String.Index(encodedOffset: i)...String.Index(encodedOffset: i)])
                if tempStoredCharacter != String(currentCharacterOfStr) {
                    return longestPrefix
                }
            }
            longestPrefix.append(tempStoredCharacter)
        }
        
        return longestPrefix
    }
}
