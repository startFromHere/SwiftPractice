//
//  _27RemoveElement.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/14.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RemoveElement {
    class func solution(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 {return 0}
        var l = 0
        var r = nums.count - 1
        
        while l < r {
            while l < r && nums[r] == val {
                r -= 1
            }
            while l < r && nums[l] != val {
                l += 1
            }
            
            nums[l] = nums[r]
        }
        if nums[l] != val { l += 1}
        return l
    }
}
