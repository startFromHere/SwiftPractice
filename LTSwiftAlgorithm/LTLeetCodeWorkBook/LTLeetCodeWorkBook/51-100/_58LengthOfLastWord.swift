//
//  _58LengthOfLastWord.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/26.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class LengthOfLastWord {
    class func solution(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let arr = Array(s)
        var ans = 0
        var hasStarted = false
        for i in stride(from: s.count-1, to: -1, by: -1) {
            if arr[i] == " "  {
                if hasStarted {
                    return ans
                } else {
                    continue
                }
            } else {
                if !hasStarted {
                    hasStarted = true
                }
                ans += 1
            }
        }
        return ans
    }
}
