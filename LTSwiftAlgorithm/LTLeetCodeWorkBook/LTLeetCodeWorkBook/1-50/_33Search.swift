//
//  _33Search.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/21.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Search {
    class func solution(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {return -1}
        
        var l = 0
        var r = nums.count - 1
        var mid = 0
        while l <= r {
            mid = (l+r)/2
            if nums[l] == target {return l}
            if nums[r] == target {return r}
            if nums[mid] == target {return mid}
            if nums[r] < nums[l] {
                if nums[mid] > nums[l] {
                    if target > nums[l] && target < nums[mid] {
                        r = mid - 1
                    } else {
                        l = mid + 1
                    }
                } else {
                    if target > nums[mid] &&  target < nums[r]  {
                        l = mid + 1
                    } else {
                        r = mid - 1
                    }
                }
            } else {
                if nums[mid] > target {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
        }
        
        return -1
        
    }
}
