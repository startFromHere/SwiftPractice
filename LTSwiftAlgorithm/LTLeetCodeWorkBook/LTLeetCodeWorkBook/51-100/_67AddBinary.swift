//
//  _67AddBinary.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/10.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class addBinary {
    static func solution(_ a: String, _ b: String) -> String {
        if b.count < a.count {
            return solution(b, a)
        }
        
        var arrA = Array(a)
        var arrB = Array(b)
        
        var ans = [Int]()
        var carry = 0
        
        while arrA.count > 0 {
            let numA = arrA.removeLast()
            let numB = arrB.removeLast()
            let sum = Int(String(numA))! + Int(String(numB))! + carry
            carry = sum >> 1
            ans.insert(sum & 1, at: 0)
        }
        
        while arrB.count > 0 {
            let numB = arrB.removeLast()
            let sum = Int(String(numB))! + carry
            carry = sum >> 1
            ans.insert(sum & 1, at: 0)
        }
        
        if carry > 0 {
            ans.insert(1, at: 0)
        }
        
        let res = ans.reduce(into: "") { (result, num) in
            result.append(String(num))
        }
        return res
    }
}
