//
//  _31NextPermutation.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/17.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class NextPermutation {
    class func solution(_ nums: inout [Int]) {
        for i in Array(stride(from: nums.count - 1, to: 0, by: -1)) {
            if nums[i] > nums[i-1] {
                var postIndex = i
                for j in i+1..<nums.count {
                    if nums[j] > nums[i-1] {
                        postIndex = j
                    }
                }
                if postIndex != i - 1 {
                    nums.swapAt(postIndex, i-1)
                    var l = i
                    var r = nums.count - 1
                    while l < r {
                        nums.swapAt(l, r)
                        l += 1
                        r -= 1
                    }
                } else {
                    nums.swapAt(i-1, i)
                }
                return
            }
        }
        nums = nums.reversed()
    }
}
