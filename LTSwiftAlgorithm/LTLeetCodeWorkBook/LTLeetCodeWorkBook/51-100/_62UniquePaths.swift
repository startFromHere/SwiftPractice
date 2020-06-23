//
//  _62UniquePaths.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/23.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class UniquePaths {
    static func solution(_ m: Int, _ n: Int) -> Int {
        var memo = [Int]()
        for _ in 0..<n {
            memo.append(1)
        }
        var row = 1, column = 1
        var top:Int, left:Int
        while row < m {
            while column < n {
                top = memo[column]
                left = memo[column - 1]
                memo[column] = top + left
                column += 1
            }
            row += 1
            column = 1
        }
        if memo.count == 0 {
            return 1
        }
        return memo.last!
    }
}
