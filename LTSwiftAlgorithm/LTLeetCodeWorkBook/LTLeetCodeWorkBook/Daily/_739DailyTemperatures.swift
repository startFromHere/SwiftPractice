//
//  _739DailyTemperatures.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/11.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class DailyTemperatures {
    static func solution(_ T: [Int]) -> [Int] {
        if (T.count <= 1) {
            return [0]
        }
        var ans = Array.init(repeating:0, count: T.count)
        var arr = [Int]()
        for i in 0..<T.count {
            while arr.count > 0 && T[arr.last!] < T[i] {
                var idx = arr.removeLast()
                ans[idx] = i - idx
            }
            arr.append(i)
        }
        return ans;
    }
}
