//
//  _85MaximalRectangle.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/21.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MaximalRectangle {
    static func solution(_ matrix: [[Character]]) -> Int {
        
        let m = matrix.count
        if m == 0 {
            return 0
        }
        var ans = 0
        let n = matrix[0].count
        
        var hMemo = Array.init(repeating: (Array.init(repeating: (0,0), count: n)), count: m)
        var vMemo = Array.init(repeating: (Array.init(repeating: (0,0), count: n)), count: m)
        
        func _solution(_ row:Int, _ column:Int, _ isHorizon:Bool) -> (Int, Int){
            if row >= m || column >= n {return (0, 0)}
            if matrix[row][column] == "0" {return (0, 0)}
            if isHorizon, hMemo[row][column] != (0, 0) {
                return hMemo[row][column]
            }
            if !isHorizon, vMemo[row][column] != (0, 0) {
                return vMemo[row][column]
            }
            let right = _solution(row, column + 1, true)
            let bottom = _solution(row+1, column, false)
            
            let height = min(bottom.0 + 1, right.0)
            let width = min(bottom.1, right.1 + 1)
            
            let maxRight = (right.1 + 1) * height
            let maxBottom = (bottom.0 + 1) * width
            
            let maxArea = max(maxRight, maxBottom)
            if maxArea > ans {
                ans = maxArea
            }
            
            hMemo[row][column] = (max(1, height), right.1 + 1)
            vMemo[row][column] = ((bottom.0 + 1), max(width, 1))
            print("h:\(row) \(column): \(hMemo[row][column])")
            print("v:\(row) \(column): \(vMemo[row][column])")
            if isHorizon {
                return hMemo[row][column]
            }
            
            return vMemo[row][column]
        }
        
        for i in 0..<m {
            for j in 0..<n {
                _ = _solution(i, j, true)
                _ = _solution(i, j, false)
            }
        }
        
        
        return ans
    }
}
