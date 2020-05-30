//
//  LengthOfLongestSubstring.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/1.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class LengthOfLongestSubstring {
    class func solution(_ s: String) -> Int {
        var longestLength = 0
        
        if s.count <= 0 {
            return 0
        }
        let arr = Array(s)
        var currentArr = [Character]()
        for count in 0 ..< arr.count {
            let character = arr[count]
            if currentArr.contains(character) {
                currentArr.removeSubrange(0...(currentArr.firstIndex(of: character) ?? 0))
            }
            currentArr.append(character)
            
            if currentArr.count > longestLength {
                longestLength = currentArr.count
            }
        }
        
        return longestLength
    }
}
