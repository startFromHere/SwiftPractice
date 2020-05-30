//
//  _26RemoveDuplicates.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/13.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RemoveDuplicates {
    class func solution(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        var l = 0
        var r = 1
        while r<nums.count {
            if nums[l] == nums[r]  {
                r += 1
            } else {
                l += 1
                nums[l] = nums[r]
                r += 1
            }
            
        }
        
        return l + 1
    }
}
