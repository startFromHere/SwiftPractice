//
//  ValidParentheses.swift
//  LTSwiftAlgorithm
//
//  Created by 刘涛 on 2018/11/4.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class ValidParentheses: LeetcodeSolution {
    override func solution() {
        let yesOrNot = isValid("([)")
    }
    
    func isValid(_ s: String) -> Bool {
        var parentthesesHeap = ""
        
        let dic = [")":"(","}":"{","]":"["]
        
        let parenttheseStr = "(){}[]"
        
        for character in s {
            if (character == Character("(") || character == Character("[") || character == Character("{")) {
                parentthesesHeap.append(character)
            } else if (character == Character(")") || character == Character("]") || character == Character("}")) {
                if let lastCharacter = parentthesesHeap.last {
                    if dic[String(character)] == String(lastCharacter) {
                        parentthesesHeap = String(parentthesesHeap.dropLast())
                    } else {
//                        parentthesesHeap.append(character)
                    }
                } else {
                    parentthesesHeap.append(character)
                }
            }
        }
        
        if parentthesesHeap.contains(where: { (char) -> Bool in
            parenttheseStr.contains(char)
        }) {
            return false
        }
        
        return true
    }
}
