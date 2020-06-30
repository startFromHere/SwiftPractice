//
//  _56.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/28.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Merge2 {
    static func solution(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count == 0 {
            return []
        }
        
        let temp = intervals.sorted{$0.first! < $1.first!}.map{($0.first!, $0.last!)}
        var ans = [[Int]]()
        
        var currentRightMax = temp[0].1
        var idx = 0
        
        while idx < temp.count {
            let left = idx
            currentRightMax = temp[left].1
            while idx < temp.count, temp[idx].0 <= currentRightMax {
                if temp[idx].1 > currentRightMax {
                    currentRightMax = temp[idx].1
                }
                idx += 1
            }
            
            ans.append([temp[left].0, currentRightMax])
            if idx == left {
                idx += 1
            }
        }
        
        return ans
    }
}
