//
//  _59GenerateMatrix.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/9.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class GenerateMatrix {
    static func solution(_ n: Int) -> [[Int]] {
        let arr = Array.init(repeating: 0, count: n)
        var matrix = Array.init(repeating: arr, count: n)
        
        
        enum Direciton:Int {
            case right = 0, down, left, up
        }
        
        var ans = 1
        
        var direction = Direciton.right
        
        var i = 0, j = 0
        var hRemainCount = n
        var vRemainCount = n
        var count = 0
        while ans <= n * n {
            count = 0
            if direction == Direciton.right {
                while count < hRemainCount {
                    matrix[i][j] = ans
                    ans += 1
                    j += 1
                    count += 1
                }
                j -= 1
                i += 1
                direction = .down
                vRemainCount -= 1
            } else if direction == Direciton.down{
                while count < vRemainCount {
                    matrix[i][j] = ans
                    ans += 1
                    i += 1
                    count += 1
                }
                i -= 1
                j -= 1
                direction = .left
                hRemainCount -= 1
            } else if direction == Direciton.left{
                while count < hRemainCount {
                    matrix[i][j] = ans
                    ans += 1
                    j -= 1
                    count += 1
                }
                j += 1
                i -= 1
                vRemainCount -= 1
                direction = .up
            } else if direction == Direciton.up{
                while count < vRemainCount {
                    matrix[i][j] = ans
                    ans += 1
                    i -= 1
                    count += 1
                }
                i += 1
                j += 1
                hRemainCount -= 1
                direction = .right
            }
        }
        
        return matrix
    }
}
