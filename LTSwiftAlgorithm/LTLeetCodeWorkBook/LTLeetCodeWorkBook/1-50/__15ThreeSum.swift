//
//  _15ThreeSum.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/9.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class ThreeSum {
    class func solution(_ nums: [Int]) -> [[Int]] {

        var sortNums = nums
        
        var containZero = false
        if sortNums.contains(0) {
            containZero = true
        } else {
            sortNums.append(0)
        }
        
        sortNums.sort()
        
        let zeroIndex = sortNums.firstIndex(of: 0) ?? 0
        
        func binarySearchIndexOfValue(_ value:Int, between left:Int, and right:Int) -> Int?{
            if left > right {return nil}
            var l = left
            var r = right
            var midIndex:Int!
            var numAtMid:Int!
            while l <= r {
                midIndex = (l+r)/2
                numAtMid = sortNums[midIndex]
                if numAtMid == value {
                    return midIndex
                } else if numAtMid < value {
                    l = midIndex + 1
                } else {
                    r = midIndex - 1
                }
            }
            return nil
        }
        
        var result = [[Int]]()
        for left in 0 ... zeroIndex {
            for right in stride(from: sortNums.count - 1, to: zeroIndex, by: -1) {
                if left > 0 && sortNums[left-1] == sortNums[left] {
                    continue
                }
                if right < sortNums.count - 1 && sortNums[right + 1] == sortNums[right] {
                    continue
                }
                
                let mid = binarySearchIndexOfValue(-(sortNums[left] + sortNums[right]), between: left + 1, and: right - 1) ?? -1
                if mid != -1 {
                    if !containZero && sortNums[mid] == 0 {
                        continue
                    }
                    result.append([sortNums[left], sortNums[mid], sortNums[right]])
                }
            }
        }
        
        return result
    }
}
