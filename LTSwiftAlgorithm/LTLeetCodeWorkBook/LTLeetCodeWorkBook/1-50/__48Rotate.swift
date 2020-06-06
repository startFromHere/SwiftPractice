//
//  _48Rotate.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/26.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Rotate {
    class func solution (_ matrix: inout [[Int]]) {
        if matrix.count <= 1 {return}
        for i in 0..<matrix.count {
            for j in 0...i {
                let v = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = v
            }
        }
        
        for i in 0..<matrix.count {
            for j in 0...(matrix.count-1) >> 1 {
                let a = matrix[i][j]
                matrix[i][j] = matrix[i][matrix.count-1-j]
                matrix[i][matrix.count - 1 - j] = a
            }
        }
    }
}
