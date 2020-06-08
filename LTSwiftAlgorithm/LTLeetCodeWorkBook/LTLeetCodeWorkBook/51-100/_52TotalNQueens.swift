//
//  _52TotalNQueens.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/7.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class TotalNQueens{
    static func solution(_ n: Int) -> Int {
        if n <= 1 {return 1}
        
        var rows = Array.init(repeating: false, count: n)
        var columns = rows
        
        var letfTopToRightBottoms = Array.init(repeating: false, count: max(0, 2*n - 1))
        var rightTopToLeftBottoms = letfTopToRightBottoms
        
        var ans = 0
        var currentArr = [(Int, Int)]()
        
        func checkAvailable(row i:Int, column j:Int) -> Bool {
            if columns[j] == true || letfTopToRightBottoms[i+j] == true || rightTopToLeftBottoms[i-j+n-1] == true {
                return false
            }
            return true
        }
        
        func setCharecter(_ isQueen:Bool, row i:Int, column j:Int) {
            rows[i] = isQueen
            columns[j] = isQueen
            letfTopToRightBottoms[i+j] = isQueen
            rightTopToLeftBottoms[i-j+n-1] = isQueen
        }
        
        func _solution(row i:Int) {
            for j in 0..<n {
                if checkAvailable(row: i, column: j) {
                    if i >= n - 1{
                        ans += 1
                    } else {
                        setCharecter(true, row: i, column: j)
                        currentArr.append((i,j))
                        _solution(row: i+1)
                    }
                }
            }
            
            if i > 0 && currentArr.count <= i {
                let index = currentArr.removeLast()
                setCharecter(false, row: index.0, column: index.1)
            }
        }
        
        _solution(row: 0)
        
        return ans
    }
}
