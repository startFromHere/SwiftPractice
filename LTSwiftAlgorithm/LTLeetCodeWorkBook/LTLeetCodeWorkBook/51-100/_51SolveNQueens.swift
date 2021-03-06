//
//  _51SolveNQueens.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/6.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SolveNQueens {
    static func solution(_ n: Int) -> [[String]] {

        if n == 0 {return [[]]}
        
        var rows = Array.init(repeating: false, count: n)
        var columns = rows
    
        var letfTopToRightBottoms = Array.init(repeating: false, count: max(0, 2*n - 1))
        var rightTopToLeftBottoms = letfTopToRightBottoms
        
        var arr = Array.init(repeating: Character("."), count: n)
        var defaultTempArr = Array.init(repeating: arr, count: n)
        
        var ans = [[String]]()
        var currentArr = defaultTempArr
        
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
            currentArr[i][j] = isQueen ? "Q" : "."
        }
        
        func removeQ(at i:Int) {
            for j in 0..<n {
                if currentArr[i][j] == "Q" {
                    setCharecter(false, row: i, column: j)
                }
            }
        }
        
        
        func _solution(row i:Int) {
            for j in 0..<n {
                if checkAvailable(row: i, column: j) {
                    if i >= n - 1{
                        currentArr[i][j] = "Q"
                        ans.append(currentArr.map{ String($0)})
                        currentArr[i][j] = "."
                        continue
                    } else {
                        setCharecter(true, row: i, column: j)
                        _solution(row: i+1)
                    }
                }
            }
            
            if i > 0 && !currentArr[i].contains("Q") {
                removeQ(at: i-1)
            }
        }
        
        _solution(row: 0)
        
        return ans
        
    }
}
