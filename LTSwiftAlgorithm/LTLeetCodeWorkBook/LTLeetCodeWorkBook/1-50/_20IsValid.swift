//
//  _20IsValid.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/4.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class IsValid {
    class func solution(_ s: String) -> Bool {
        if s.count == 0 {return true}
        let dic = ["}": "{", "]":"[", ")":"("]
        var result = [Character]()
        let arr = Array(s)
        
        for char in arr {
            if let machedChar = dic[String(char)] {
                if result.count == 0 {
                    return false
                }
                if String(result.last!) == machedChar {
                    result.removeLast()
                    continue
                }
            }
            result.append(char)
        }
        return result.count == 0
    }
}
