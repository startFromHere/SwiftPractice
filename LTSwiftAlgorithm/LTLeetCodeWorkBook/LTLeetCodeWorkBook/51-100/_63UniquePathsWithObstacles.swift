//
//  _63UniquePathsWithObstacles.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/1.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class UniquePathsWithObstacles {
    static func solution(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.count == 0 {
            return 0
        }
        let rowNum = obstacleGrid.count, columnNum = obstacleGrid.last!.count
        if columnNum == 0 {return 0}
        
        var dp = [Int]()
        for i in 0..<columnNum {
            var num: Int
            if i == 0 {
                num = obstacleGrid[0][i] == 0 ? 1 : 0
            } else {
                num = obstacleGrid[0][i] == 0 ? dp[i-1] : 0
            }
            dp.append(num)
        }
        
        for i in 1..<rowNum {
            dp[0] = obstacleGrid[i][0] == 0 ? dp[0] : 0
            for j in 1..<columnNum{
                dp[j] = obstacleGrid[i][j] == 0 ? dp[j-1] + dp[j] : 0
            }
        }
        
        return dp[columnNum - 1]
        
    }
    
    static func solution1(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid.count < 1 {return 0}
        let rowNum = obstacleGrid.count, columnNum = obstacleGrid.last!.count
        if columnNum < 1 {return 0}
        func _solution(at row:Int, _ column:Int) -> Int {
            if row == 0 || column == 0 {
                if obstacleGrid[row][column] == 1 {
                    return 0
                }
                return 1
            }
            if row < 0 || column < 0 {
                return 0
            }
            if obstacleGrid[row][column] == 1 {
                return 0
            }
            return _solution(at: row, column - 1) + _solution(at: row - 1, column)
        }
        
        return _solution(at: rowNum - 1, columnNum - 1)
    }
}
