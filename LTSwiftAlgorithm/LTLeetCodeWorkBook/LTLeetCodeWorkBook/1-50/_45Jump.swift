//
//  _45Jump.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/19.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Jump {
    class func solution(_ nums: [Int]) -> Int {
        var i = 0;
        var steps = 0
        var furthestValue:Int
        while i < nums.count - 1 {
            if nums[i] + i >= nums.count - 1 {
                return steps + 1;
            }
            furthestValue = 0
            for j in i+1...i+nums[i] {
                if nums[j] + j >= nums.count - 1 {
                    return steps + 2
                } else if (nums[j] + j) > furthestValue {
                    furthestValue = nums[j] + j
                    i = j
                }
            }
            steps += 1
        }
        return steps;
    }
}
