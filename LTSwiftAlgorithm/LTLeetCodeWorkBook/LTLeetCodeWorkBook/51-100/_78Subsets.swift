//
//  _78Subsets.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/12.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Subsets {
    static func solution(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        
        func helper(start: Int, current arr:[Int]) {
            ans.append(arr)
            
            if start >= nums.count {
                return
            }
            
            for j in start..<nums.count {
                var tempArr = arr
                tempArr.append(nums[j])
                helper(start: j+1, current:tempArr)
            }
        }
        
        helper(start: 0, current: [])
        
        return ans
    }
}
