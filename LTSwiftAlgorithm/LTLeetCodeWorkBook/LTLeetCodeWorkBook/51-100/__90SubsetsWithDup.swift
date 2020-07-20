//
//  _90SubsetsWithDup.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/13.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class subsetsWithDup {
    static func solution(_ nums: [Int]) -> [[Int]] {
        var arr = nums.sorted()
        var ans = [[Int]]()
        func helper(start: Int, tempArr: [Int]) {
            ans.append(tempArr)
            if start >= nums.count {
                return
            }
            for i in start..<arr.count {
//                if i > 0, arr[i] == arr[i-1] {
//                    continue
//                }
                var curArr = tempArr
                curArr.append(arr[i])
                helper(start: start + 1, tempArr: curArr)
            }
        }
        helper(start: 0, tempArr: [])
        return ans
    }
}
