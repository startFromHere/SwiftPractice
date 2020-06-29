//
//  _93RestoreIpAddresses.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/29.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class restoreIpAddresses {
    static func solution(_ s: String) -> [String] {
        if s.count < 4 {return []}
        var ans: [String] = []
        let arr = Array(s)
        var idx0 = 0, idx1 = 1, idx2 = s.count - 2
        
        func _solution(_s: String, count: Int) {
            while idx0 < idx1 {
                let num0 = Int(String(arr[0...idx0]))!
                while idx1 < idx2 {
                    let num1 = Int(String(arr[idx0+1...idx1]))!
                    while idx2 < s.count - 1 {
                        let num2 = Int(String(arr[idx1+1...idx2]))!
                        let num3 = Int(String(arr[idx2+1...s.count - 1]))!
                        if num0 < 256, num1 < 256, num2 < 256,num3 < 256{
                            ans.append("\(num0)\(num1)\(num2)\(num3)")
                        }
                    }
                }
            }
        }
        
        return ans
    }
}
