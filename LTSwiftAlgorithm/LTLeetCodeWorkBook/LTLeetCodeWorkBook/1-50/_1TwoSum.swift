//
//  TwoSum.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/4/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class TwoSum {
    class func solution(_ nums: [Int], _ target: Int) -> [Int] {
        var valuesDic = [Int : Int]()
        for i in 0..<nums.count {
            if let storedValue = valuesDic[target - nums[i]] {
                return [storedValue, i]
            } else {
                valuesDic[nums[i]] = i
            }
        }
        
        return [Int]()
    }
}
