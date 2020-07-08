//
//  _136SingleNumber.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/8.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SingleNumber {
    static func solution(_ nums: [Int]) -> Int {
        var ans = 0
        for num in nums {
            ans ^= num
        }
        return ans
    }
}
