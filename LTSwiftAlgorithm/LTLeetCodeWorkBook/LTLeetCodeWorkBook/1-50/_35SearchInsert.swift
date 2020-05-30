//
//  _35SearchInsert.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/25.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SearchInsert {
    class func solution(_ nums: [Int], _ target: Int) -> Int {
        
        var l = 0, r = nums.count - 1
        var mid:Int
        while l <= r {
//            if nums[r] < target {return r+1}
//            if nums[l] > target {return l}
            
            mid = (l+r) >> 1
            if (nums[mid]) > target {
                r = mid - 1
            } else if (nums[mid]) < target {
                l = mid + 1
            } else {
                return mid
            }
        }
        return l
    }
}
