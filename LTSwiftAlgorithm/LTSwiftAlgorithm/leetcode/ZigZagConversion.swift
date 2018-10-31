//
//  ZigZagConversion.swift
//  LTSwiftAlgorithm
//
//  Created by 移动支付－刘涛 on 2018/10/29.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class ZigZagConversion: LeetcodeSolution {
    override func solution() {
        let s = "ABC"
        self.convert(s, 3)
    }
    
    func convert(_ s: String, _ numRows: Int) -> String {
        if (numRows < 2 || s.count <= 2) {
            return s
        }
        
        var tailNumberOfLines = 0
        if s.count%(2*numRows - 2) > numRows {
            tailNumberOfLines = 1 + s.count%(2*numRows - 2)%numRows
        } else if s.count%(2*numRows - 2) > 0  {
            tailNumberOfLines = 1
        }
        var tailNumberOfRows = 0
        if s.count%(2*numRows - 2) > numRows {
            tailNumberOfRows = numRows - s.count%(2*numRows - 2)%numRows%numRows
        } else if s.count%(2*numRows - 2) == 0  {
            tailNumberOfRows = numRows
        } else if s.count%(2*numRows - 2) > 0  {
            tailNumberOfRows = s.count%(2*numRows - 2)%numRows
        }
        
        let numberOfLines = s.count/(2*numRows - 2)*(numRows - 1) + tailNumberOfLines
        var arr = Array(repeating: Array(repeating: " ", count: numberOfLines), count: numRows)
        var index = 0
        for i in 0..<numberOfLines {
            for j in 0..<numRows {
                if i == numberOfLines - 1 && j >= tailNumberOfRows {
                    continue
                }
                if i%(numRows-1) == 0 || i%(numRows - 1)+j == numRows - 1{
                    arr[j][i] = String(s[String.Index(encodedOffset: index)...String.Index(encodedOffset: index)])
                    index += 1
                } else {
                    arr[j][i] = " "
                }
            }
        }
        
        var result = ""
        var currentCharacter:Character
        for i in 0..<numRows {
            for j in 0..<numberOfLines {
                currentCharacter = (Character)(arr[i][j])
                if currentCharacter != Character(" ") {
                    result.append(currentCharacter)
                }
            }
        }
        
        return result
    }
}
