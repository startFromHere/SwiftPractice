//
//  二进制中 1 的个数.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/10.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class HammingWeight {
    static func solution(_ n: Int) -> Int {
        var ans = 0
        var num = n
        while num > 0 {
            ans += 1
            num = (num & num - 1)
        }
        return ans
    }
}
