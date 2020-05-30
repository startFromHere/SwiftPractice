//
//  _14LongestCommonPrefix.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/3.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class LongestCommonPrefix {
    class func solution(_ strs: [String]) -> String {
        
        if strs.count == 0 {
            return ""
        } else if strs.count == 1 {
            return strs[0]
        }
        
        func commonPrefix(_ str1:String, _ str2:String) -> String {
            var prefix = ""
            let count = min(str1.count, str2.count)
            for i in 0..<count {
                let char1 = str1[str1.index(str1.startIndex, offsetBy: i)]
                let char2 = str2[str2.index(str2.startIndex, offsetBy: i)]
                if char1 == char2 {
                    prefix.append(char1)
                } else {
                    break
                }
            }
            return prefix
        }
        
        var prefix = strs[0]
        var currentString:String
        for i in 1..<strs.count {
            currentString = strs[i]
            prefix = commonPrefix(prefix, currentString)
        }
        
        return prefix
    }
}
