//
//  _55CanJump.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/8.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class CanJump {
    class func solution(_ nums: [Int]) -> Bool {
        var dp = [Int: Bool]()
        
        func _solution1(from index: Int) -> Bool {
            if let ans = dp[index] {
                return ans
            }
            if nums[index] == 0 {
                return false
            }
            
            if nums[index] + index >= nums.count - 1{
                dp[index] = true
                return true
            } else {
                for reachableIndex in index+1...index + nums[index] {
                    if _solution1(from: reachableIndex) {
                        dp[index] = true
                        return true
                    }
                }
            }
            
            return false
        }
        
        
        func _solution2() -> Bool {
            var dp2 = [Int]()
            var index = 0
            for i in 0..<nums.count {
                index = nums.count - 1 - i
                if nums[index] == 0 {
                    continue
                }
                if nums[index] + index >= nums.count - 1{
                    dp2.append(index)
                } else {
                    for reachableIndex in index+1...index + nums[index] {
                        if dp2.contains(reachableIndex) {
                            dp2.append(index)
                            break
                        }
                    }
                }
            }
            
            return dp2.contains(0)
        }
        
        
        func _solution3() -> Bool {
            var countOfZero = 0
            for i in (0..<nums.count).reversed() {
                if nums[i] > countOfZero {
                    countOfZero = 0
                } else if nums[i] + i >= nums.count - 1 {
                    countOfZero = 0
                } else {
                    countOfZero += 1
                }
            }
            return countOfZero == 0
        }
        
        return _solution3()
    }
}
