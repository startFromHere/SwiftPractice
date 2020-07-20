//
//  _81Search.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/20.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Search1 {
    static func solution(_ nums: [Int], _ target: Int) -> Bool {
        
        func _solution(from l: Int, to r: Int) -> Bool {
            if l > r {
                return false
            }
            let mid = (l+r)/2
            let midValue = nums[mid]
            if target == midValue {
                return true
            } else if nums[l] < nums[r] {
                if nums[l] > target || nums[r] < target {
                    return false
                } else {
                    if target > midValue {
                        return _solution(from: mid + 1, to: r)
                    } else {
                        return _solution(from: l, to: mid - 1)
                    }
                }
            } else {
                return _solution(from: l, to: mid-1) || _solution(from: mid+1, to: r)
            }
        }
        
        return _solution(from: 0, to: nums.count - 1)
    }
}
