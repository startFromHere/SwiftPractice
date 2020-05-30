//
//  _37swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/26.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SolveSudoku {
    
    var blankIndexes = [(Int, Int)]()
    var rows = [[Character]]()
    var colums =  [[Character]]()
    var grids = [[Character]]()
    
    func solution(_ board: inout [[Character]]){
        for _ in 0..<9 {
            rows.append([Character]())
            colums.append([Character]())
            grids.append([Character]())
        }
        
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    blankIndexes.append((i,j))
                } else {
                    rows[i].append(board[i][j])
                    colums[j].append(board[i][j])
                    grids[i/3 * 3 + j/3].append(board[i][j])
                }
            }
        }
        
        while blankIndexes.count > 0 {
            tryToFillInWithAnNumInCandidateNums(&board)
        }
    }

    func getCandidateNumberOf(_ index:(Int, Int), _ board:[[Character]]) -> [Character] {
        var candidateNums:[Character] = ["1","2","3","4","5","6","7","8","9"]
        for char in rows[index.0] {
            candidateNums.removeAll { $0 == char}
        }
        for char in colums[index.1] {
            candidateNums.removeAll { $0 == char}
        }
        for char in grids[index.0/3 * 3 + index.1/3] {
            candidateNums.removeAll { $0 == char}
        }
        
        return candidateNums
    }
    
    func tryToFillInWithAnNumInCandidateNums(_ board: inout [[Character]]) {
        if blankIndexes.count == 0 {return}
        var candidates:[Character] = ["1","2","3","4","5","6","7","8","9"]
        var tryIndex = blankIndexes.first!
        for index in blankIndexes {
            let cands = getCandidateNumberOf(index, board)
            if candidates.count > cands.count {
                candidates = cands
                tryIndex = index
            }
        }
        
        if candidates.count == 0 {
            return;
        }
        
        for char in candidates {
            board[tryIndex.0][tryIndex.1] = char
            
            rows[tryIndex.0].append(char)
            colums[tryIndex.1].append(char)
            grids[tryIndex.0/3 * 3 + tryIndex.1/3].append(char)
            blankIndexes.removeAll {$0 == tryIndex}
            tryToFillInWithAnNumInCandidateNums(&board)
            if blankIndexes.count == 0 {
                return
            } else {
                rows[tryIndex.0].removeAll {$0 == board[tryIndex.0][tryIndex.1] }
                colums[tryIndex.1].removeAll {$0 == board[tryIndex.0][tryIndex.1] }
                grids[tryIndex.0/3 * 3 + tryIndex.1/3].removeAll {$0 == board[tryIndex.0][tryIndex.1] }
                blankIndexes.append(tryIndex)
                board[tryIndex.0][tryIndex.1] = "."
            }
        }
    }
    
    
    
}


/*
class Solution {
    func solveSudoku(_ board: inout [[Character]]){
        var dots = _blankIndexes(board)
        while dots.count > 0 {
            tryToFillInWithAnNumInCandidateNums(&board)
            dots = _blankIndexes(board)
        }
    }
    
    func _blankIndexes(_ board:[[Character]]) -> [(Int, Int)] {
        var res = [(Int, Int)]()
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    res.append((i, j))
                }
            }
        }
        return res
    }
    
    func getCandidateNumberOf(_ index:(Int, Int), _ board:[[Character]]) -> [Character] {
        
        var rows = [[Character]]()
        for _ in 1...9 {
            rows.append([Character]())
        }
        var colums = rows
        var grids = rows
        
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    rows[i].append(board[i][j])
                    colums[j].append(board[i][j])
                    grids[i/3 * 3 + j/3].append(board[i][j])
                }
            }
        }
        
        var candidateNums:[Character] = ["1","2","3","4","5","6","7","8","9"]
        for char in rows[index.0] {
            candidateNums.removeAll { $0 == char}
        }
        for char in colums[index.1] {
            candidateNums.removeAll { $0 == char}
        }
        for char in grids[index.0/3 * 3 + index.1/3] {
            candidateNums.removeAll { $0 == char}
        }
        
        return candidateNums
    }
    
    func tryToFillInWithAnNumInCandidateNums(_ board: inout [[Character]]) {
        let indexes = _blankIndexes(board)
        if  indexes.count == 0 {return}
        var candidates:[Character] = ["1","2","3","4","5","6","7","8","9"]
        var tryIndex = indexes.first!
        for index in indexes {
            let cands = getCandidateNumberOf(index, board)
            if candidates.count > cands.count {
                candidates = cands
                tryIndex = index
            }
        }
        
        if candidates.count == 0 {
            return;
        }
        
        for char in candidates {
            board[tryIndex.0][tryIndex.1] = char
            tryToFillInWithAnNumInCandidateNums(&board)
            if _blankIndexes(board).count == 0 {
                return
            } else {
                for index in indexes {
                    board[index.0][index.1] = "."
                }
            }
        }
    }
}
*/
