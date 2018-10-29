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
        let s = "PAYPALISHIRING"
        self.convert(s, 3)
    }
    
    func convert(_ s: String, _ numRows: Int) -> String {
        if (numRows < 2 || s.count < 2) {
            return s
        }
        
        let numberOfLines = s.count/numRows > 1 ? s.count/numRows : 1
        var arr = Array(repeating: Array(repeating: " ", count: numberOfLines), count: numRows)
        var index = 0
        for character in s {
            if index/(numberOfLines) == 0 {
                arr[index%(numRows)][index/(numberOfLines)] = String(character)
            } else if (index%(numRows) + index/(numberOfLines - 1) == numRows - 1) {
                arr[index%(numRows)][index/(numberOfLines)] = String(character)
            } else {
                arr[index%(numRows)][index/(numberOfLines)] = " "
            }
            index += 1
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
