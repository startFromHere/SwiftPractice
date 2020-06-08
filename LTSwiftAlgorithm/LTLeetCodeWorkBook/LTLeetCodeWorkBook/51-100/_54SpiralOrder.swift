//
//  _54SpiralOrder.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/8.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SpiralOrder {
    static func solution(_ matrix: [[Int]]) -> [Int] {
        let m = matrix.count
        if m == 0 {return []}
        let n = matrix.first!.count
        if n == 0 {return []}
        
        enum Direciton:Int {
            case right = 0, down, left, up
        }
        
        var ans = [Int]()
        
        var direction = Direciton.right
        
        var i = 0, j = 0
        var hRemainCount = n
        var vRemainCount = m
        var count = 0
        while ans.count < m * n {
            count = 0
            if direction == Direciton.right {
                while count < hRemainCount {
                    ans.append(matrix[i][j])
                    j += 1
                    count += 1
                }
                j -= 1
                i += 1
                direction = .down
                vRemainCount -= 1
            } else if direction == Direciton.down{
                while count < vRemainCount {
                    ans.append(matrix[i][j])
                    i += 1
                    count += 1
                }
                i -= 1
                j -= 1
                direction = .left
                hRemainCount -= 1
            } else if direction == Direciton.left{
                while count < hRemainCount {
                    ans.append(matrix[i][j])
                    j -= 1
                    count += 1
                }
                j += 1
                i -= 1
                vRemainCount -= 1
                direction = .up
            } else if direction == Direciton.up{
                while count < vRemainCount {
                    ans.append(matrix[i][j])
                    i -= 1
                    count += 1
                }
                i += 1
                j += 1
                hRemainCount -= 1
                direction = .right
            }
        }
        
        return ans
    }
}
