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
        if matrix.count == 0 {
            return 0
        }
        
        func maxArea(of values:[Int]) ->Int {
            var tempValues = values
            tempValues.append(0)
            
            var stack = [Int]()
            var res = 0
            for i in 0..<tempValues.count {
                while stack.count > 0, tempValues[stack.last!] > tempValues[i] {
                    let idx = stack.removeLast()
                    let height = tempValues[idx]
                    var currentLastIndex = 0
                    if stack.count > 0 {
                        currentLastIndex = stack.last! + 1
                    }
                    res = max(res, height * (i - currentLastIndex))
                }
                stack.append(i)
            }
            return res
        }
        
        let height = matrix.count
        let width = matrix[0].count
        var heights = Array.init(repeating: 0, count: width)
        
        var ans = 0
        
        if matrix.count == 0 {return 0}
        for i in 0..<height{
            for j in 0..<width {
                if matrix[i][j] == "1" {
                    heights[j] += 1
                } else {
                    heights[j] = 0
                }
            }
            ans = max(ans, maxArea(of: heights))
        }
        
        return ans
    }
}
