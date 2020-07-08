//
//  _150EvalRPN.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/4.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class EvalRPN {
    static func solution(_ tokens: [String]) -> Int {
        
        if tokens.count < 1 || Int(tokens.first!) == nil {
            return 0
        }
        let firstValue = Int(tokens.first!)!
        var stack = [Int]()
        stack.append(firstValue)
        var idx = 1
        
        func caculateBy(symbol: String) -> Int {
            let value2 = stack.removeLast()
            let value1 = stack.removeLast()
            if symbol == "+" {
                return value1 + value2
            } else if symbol == "-" {
                return value1 - value2
            } else if symbol == "*" {
                return value1 * value2
            } else {
                return value1 / value2
            }
        }
        while idx < tokens.count {
            let symbol = tokens[idx]
            var value: Int
            if symbol == "+" || symbol == "-" || symbol == "*" || symbol == "/"{
                value = caculateBy(symbol: symbol)
            } else {
                value = Int(tokens[idx])!
            }
            stack.append(value)
            idx += 1
        }
        return stack.first!
    }
}
