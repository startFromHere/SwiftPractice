//
//  _36IsValidSudoku.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/25.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class IsValidSudoku {
    
    class func solution(_ board: [[Character]]) -> Bool {
        var currentChar:Character
        var rows = [[Character]]()
        for _ in 0...9 {
            rows.append([Character]())
        }
//            NSMutableArray(object: repeatElement([Character](), count: 9)) as! [[Character]]
        var colums = rows
        var grids = rows
        for i in 0..<9 {
            for j in 0..<9 {
                currentChar = board[i][j]
                if currentChar > "9" || currentChar < "0" {continue}
                if (rows[i].contains(currentChar)) {
                return false}
                rows[i].append(currentChar)
                
                if colums[j].contains(currentChar) {
                return false}
                colums[j].append(currentChar)
                
                if grids[i/3 * 3 + j/3].contains(currentChar) {
                return false}
                grids[i/3 * 3 + j/3].append(currentChar)
            }
        }
        return true
    }
    
    class func solution1(_ board: [[Character]]) -> Bool {
        var currentChar:Character
        for i in 0..<9 {
            for j in 0..<9 {
                currentChar = board[i][j]
                if currentChar > "9" || currentChar < "0" {continue}
                //row
                for k in 0..<9 {
                    if k == j {continue}
                    if board[i][k] == currentChar {
                        return false
                    }
                }
                //column
                for k in 0..<9 {
                    if k == i {continue}
                    if board[k][j] == currentChar {
                        return false}
                }
                
                //grid
                for k in 0..<9 {
                    if ((i/3)*3 + k/3) == i && ((j/3)*3 + k%3) == j {continue}
                    if board[(i/3)*3 + k/3][(j/3)*3 + k%3] == currentChar {
                        return false}
                }
            }
        }
        return true
    }
}
