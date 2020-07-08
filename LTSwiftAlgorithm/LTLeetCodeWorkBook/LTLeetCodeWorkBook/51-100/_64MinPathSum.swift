//
//  _64MinPathSum.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/1.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MinPathSum {
    static func solution(_ grid: [[Int]]) -> Int {
        var dp = [Int]()
        let rowCount = grid.count
        if rowCount == 0 {return 0}
        let columnCount = grid.first!.count
        if columnCount == 0 {return 0}
        
        for i in 0..<columnCount {
            var num: Int
            if i == 0 {
                num = grid[0][0]
            } else {
                num = dp.last! + grid[0][i]
            }
            dp.append(num)
        }
        
        for i in 1..<rowCount {
            dp[0] = dp[0] + grid[i][0]
            for j in 1..<columnCount {
                dp[j] = min(dp[j-1], dp[j]) + grid[i][j]
            }
        }
        
        return dp[columnCount - 1]
    }
}
