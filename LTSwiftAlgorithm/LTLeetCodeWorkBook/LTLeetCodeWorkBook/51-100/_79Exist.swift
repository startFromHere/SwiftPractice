//
//  _79Exist.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/15.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Exist {
    static func solution(_ board: [[Character]], _ word: String) -> Bool {
        if board.count == 0 {return false}
        if board.first!.count == 0 {return false}
        
        let i = board.count , j = board.first!.count
        
        var usedPositions = Array(repeating: Array(repeating: 0, count: j), count: i)
        
        let chars = Array(word)
        
        func match(to charIdx: Int, at row:Int, and column:Int) -> Bool{
            if charIdx >= word.count {
                return true
            } else if usedPositions[row][column] == 1 {
                return false
            } else {
                 if board[row][column] == chars[charIdx] {
                    if charIdx == word.count - 1 {
                        return true
                    }
                    
                    usedPositions[row][column] = 1
                    //up
                    if column > 0 {
                        if match(to: charIdx+1, at: row, and: column-1) {
                            return true
                        }
                    }
                    //right
                    if row < i - 1 {
                        if match(to: charIdx+1, at: row+1, and: column) {
                            return true
                        }
                    }
                    //down
                    if column < j - 1 {
                        if match(to: charIdx+1, at: row, and: column+1) {
                            return true
                        }
                    }
                    //left
                    if row > 0 {
                        if match(to: charIdx+1, at: row-1, and: column) {
                            return true
                        }
                    }
                    
                    usedPositions[row][column] = 0
                 }
            }
            return false
        }
        
        for row in 0..<i {
            for column in 0..<j {
                if match(to: 0, at: row, and: column) {
                    return true
                }
            }
        }
        
        return false
    }
}
