//
//  _93RestoreIpAddresses.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/29.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RestoreIpAddresses {
    static func solution(_ s: String) -> [String] {
        if s.count < 4 || s.count > 12 {return []}
        var arr = Array(s)
        var ans = [String]()
        var temp = [String]()
        func _valid(from idx: Int, remainCount count: Int) {
            if idx >= s.count {return}
            if count == 1 {
                var str = String(arr[idx...s.count-1])
                var value = Int(str)!
                if (value < 256) && (!(str.count > 1 && str.hasPrefix("0")))  {
                    temp.append(str)
                    ans.append(temp.joined(separator: "."))
                    temp.removeLast()
                }
            } else {
                var endIndex = idx
                var str = String(arr[idx...endIndex])
                while Int(str)! < 256 {
                    if !(str.count > 1 && str.hasPrefix("0")) {
                        temp.append(str)
                        _valid(from: endIndex+1, remainCount: count - 1)
                        temp.removeLast()
                        
                    }
                    endIndex += 1
                    if endIndex >= s.count {
                        return
                    }
                    str = String(arr[idx...endIndex])
                }
            }
        }
        
        _valid(from: 0, remainCount: 4)
        return ans
    }
}
