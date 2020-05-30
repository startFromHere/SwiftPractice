//
//  _42Trap.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/18.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Trap {
    
//    class func solution(_ height: [Int]) -> Int {
//        var left = 0
//        var right = height.count - 1
//        var leftMax = 0
//        var rightMax = 0
//        var ans = 0
//        while left<right {
//            if height[left] < height[right] {
//                height[left] > leftMax ? (leftMax = height[leftMax]) : (ans += (leftMax - height[left]))
//                left += 1
//            } else {
//                height[right] > rightMax ? rightMax = height[rightMax] : (ans += (rightMax - height[right]))
//                right -= 1
//            }
//        }
//        return ans
//    }
    
    class func solution1(_ height: [Int]) -> Int {
        if height.count < 3 {return 0}
        var memo = Array.init(repeating: 0, count: height.count)
        memo[2] = max(0, min(height[0], height[2]) - height[1])
        var leftIndex:Int
        for i in 3..<height.count {
            if height[i] <= height[i-1] {
                memo[i] = memo[i-1]
            } else {
                leftIndex = i-1
                for j in stride(from: i-1, to: -1, by: -1) {
                    if height[j] > height[i] {
                        var sum = 0
                        for k in j+1..<i {
                            sum += height[k]
                        }
                        memo[i] = memo[j] + (i - j - 1) * height[i] - sum
                        break
                    } else {
                        if height[j] > height[leftIndex] {
                            leftIndex = j
                        }
                    }
                    if j <= 0 {
                        if height[leftIndex] > height[i-1] {
                            var sum = 0
                            for k in leftIndex+1..<i {
                                sum += height[k]
                            }
                            memo[i] = memo[leftIndex] + (i - leftIndex - 1) * height[leftIndex] - sum
                        } else {
                            memo[i] = memo[i-1]
                        }
                    }
                }
            }
        }
        return memo[height.count - 1]
    }
}
