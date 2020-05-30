//
//  _53MaxSubArray.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/16.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MaxSubArray {
    class func solution(_ nums: [Int]) -> Int {
        if nums.count == 0 {return 0}
        var ans = nums[0]
        var currentMax = nums[0]
        for i in 1..<nums.count {
            currentMax = max(currentMax + nums[i], nums[i])
            ans = max(ans, currentMax)
        }
        return ans
    }
}
