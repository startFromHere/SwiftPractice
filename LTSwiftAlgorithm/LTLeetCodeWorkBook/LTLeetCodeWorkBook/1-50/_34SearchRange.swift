//
//  _34SearchRange.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/22.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class searchRange {
    class func solution(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 {return [-1, -1]}
        
        var l = 0, r = nums.count - 1
        var mid = (l+r) >> 1
        while nums[mid] != target {
            if nums[mid] > target {
                r = (l + r) >> 1 - 1
            } else if nums[mid] < target {
                l = (l + r) >> 1 + 1
            } else {
                break
            }
            
            if l > r {
                return [-1, -1]
            }
            mid = (l+r) >> 1
        }
        
        var lr = (l+r) >> 1
        var rl = lr
        
        while nums[l] < target || nums[r] > target {
            mid = (l+lr) >> 1
            if nums[mid] < target {
                l = mid + 1
            } else {
                lr = mid - 1
            }
            if l == lr && nums[l] < target {
                l += 1
            }
            
            
            mid = (rl + r) >> 1
            if nums[mid] > target {
                r = mid - 1
            } else {
                rl = mid + 1
            }
            if rl == r && nums[r] > target {
                r -= 1
            }
        }
        
        return [l, r]
    }
}
