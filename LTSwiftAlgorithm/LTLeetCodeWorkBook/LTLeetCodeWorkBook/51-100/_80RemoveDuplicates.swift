//
//  _80RemoveDuplicates.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/17.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RemoveDuplicates2 {
    static func solution(_ nums: inout [Int]) -> Int {
        if nums.count < 3 {
            return nums.count
        }
        var j = 1, count = 1
        var i = 1
        while i < nums.count {
            if nums[i] == nums[i-1] {
              count += 1
            } else {
                count = 1
            }
            if count <= 2 {
                nums[j] = nums[i]
                j += 1
            }
            i += 1
        }
        
        return j
    }
}
