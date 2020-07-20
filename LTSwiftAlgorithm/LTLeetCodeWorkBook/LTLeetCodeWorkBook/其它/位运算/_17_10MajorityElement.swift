//
//  _17_10MajorityElement.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/8.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MajorityElement {
    static func solution (_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return -1
        }
        var count = 1
        var pre = nums[0]
        var cur: Int
        for i in 1..<nums.count {
            cur = nums[i]
            if cur == pre {
                count += 1
            } else {
                count -= 1
            }
            if count <= 0 {
                pre = cur
                count = 0
            }
        }
        
        return 0
    }
}
