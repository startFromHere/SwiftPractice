//
//  _46Permute.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/2.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Permute{
    class func solution(_ nums: [Int]) -> [[Int]] {
        var dp = [[Int]]()
        for i in 0..<nums.count {
            dp.append([nums[i]])
        }
        
        if nums.count <= 1 {return dp}
        var ans = [[Int]]()
        var tempArr:[Int]
        for _ in 1..<nums.count {
            for j in 0..<dp.count {
                for k in 0..<nums.count {
                    tempArr = dp[j]
                    if !dp[j].contains(nums[k]) {
                        tempArr.append(nums[k])
                        ans.append(tempArr)
                    }
                }
            }
            dp = ans
            ans = [[Int]]()
        }
        return dp
    }
    
    class func solution1(_ nums: [Int]) -> [[Int]] {
        
        if nums.count == 0 {
            return [[Int]]()
        }
        
        if nums.count == 1 {
            return [[nums.last!]]
        }
        
        var ans = [[Int]]()
        
        var tempArr:[Int]
        var postArrs:[[Int]]
        for i in 0..<nums.count {
            postArrs = solution(nums.filter{$0 != nums[i]})
            for arr in postArrs {
                tempArr = [nums[i]]
                tempArr.append(contentsOf: arr)
                ans.append(tempArr)
            }
        }
        
        return ans
    }
}
