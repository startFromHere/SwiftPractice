//
//  _73SetZeroes.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/16.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SetZeroes {
    static func solution(_ matrix: inout [[Int]]) {
        if matrix.count == 0 || matrix.first!.count == 0 {
            return
        }
        let i = matrix.count, j = matrix.first!.count
        
        var positions:[(Int, Int)] = []
        for row in 0..<i {
            for column in 0..<j {
                if matrix[row][column] == 0 {
                    positions.append((row, column))
                }
            }
        }
        
        for position in positions {
            let row = position.0, column = position.1
            for tempRow in 0..<i {
                matrix[tempRow][column] = 0
            }
            
            for tempColumn in 0..<j {
                matrix[row][tempColumn] = 0
            }
        }
    }
}
