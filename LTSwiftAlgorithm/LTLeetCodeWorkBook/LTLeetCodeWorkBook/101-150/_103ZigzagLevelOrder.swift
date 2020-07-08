//
//  _103ZigzagLevelOrder.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/23.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class zigzagLevelOrder {
    static func solution(_ root: TreeNode?) -> [[Int]] {
        var ans = levelOrder.solution(root)
        var i = 0
        ans = ans.map {
            if i % 2 == 0 {
                return $0
            } else {
                return $0.reversed()
            }
            i += 1
        }
         return ans
    }
}
