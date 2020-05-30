//
//  _48Rotate.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/26.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class rotate {
    class func solution (_ matrix: inout [[Int]]) {
        var nums = [Int]()
        var i = 0
        var n = matrix.count
        for i in 0..<n * 4 - 4 {
            if i < n {
                nums.append(matrix[0][i])
            } else if i < 2 * n - 2 {
                nums.append(matrix[i - n][n])
            } else if i < 3 * n - 3{
                nums.append(matrix[n-1][i - 2*n + 1])
            } else {
                nums.append(matrix[0][4 * n - 4 - n])
            }
        }
        
        
    }
}
