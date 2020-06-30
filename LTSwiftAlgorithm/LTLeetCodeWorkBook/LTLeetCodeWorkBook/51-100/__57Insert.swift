//
//  _57Insert.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Insert {
    
    static func solution(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]]{
        var ans = [[Int]]()
        var insterArr = newInterval
        var idx = 0
        var insertIndex = intervals.count
        while idx < intervals.count {
            let arr = intervals[idx]
            if arr.last! < insterArr.first! {
                ans.append(arr)
            } else if arr.first! > insterArr.last! {
                ans.append(arr)
            } else {
                insterArr = [min(arr.first!, insterArr.first!), max(arr.last!, insterArr.last!)]
            }
            if insertIndex > idx && insterArr.first! <= arr.first! {
                insertIndex = idx
            }
            idx += 1
        }
        
        ans.insert(insterArr, at: insertIndex)
        
        return ans
    }
}
