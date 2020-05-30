//
//  _16threeSumClosest.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/10.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class threeSumCloses {
    class func solution(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return nums.reduce(0) {$0+$1}
        }
        let newNums = nums.sorted()
        var tempSum = 0
        var result:Int = nums[0] + nums[1] + nums[2]
        for i in 0...(nums.count - 3) {
            var j = i+1
            var k = nums.count-1
            while j < k {
                tempSum = newNums[i] + newNums[j] + newNums[k]
                if abs(tempSum - target) < abs(result - target) {
                    result = tempSum
                }
                if tempSum < target {
                    j += 1
                } else if tempSum > target {
                    k -= 1
                } else {
                    return result
                }
                
            }
        }
        
        return result
    }
}
