//
//  _300LengthOfLIS.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/19.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class LengthOfLIS {
    class func solution(_ nums: [Int]) -> Int {
        if nums.count == 0 {return 0}
        var memo = Array.init(repeating: 1, count: nums.count)
        var maxLength = 1
        for i in 1..<nums.count {
            var max = 1
            for j in 0..<i {
                if nums[i] > nums[j] {
                    if memo[j] + 1 > max {
                        max = memo[j] + 1
                    }
                }
            }
            memo[i] = max
            if memo[i] > maxLength {
                maxLength = memo[i]
            }
        }
        return maxLength
    }
}
