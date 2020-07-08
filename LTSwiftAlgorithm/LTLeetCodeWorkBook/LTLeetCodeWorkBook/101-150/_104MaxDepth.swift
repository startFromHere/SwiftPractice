//
//  _104MaxDepth.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/23.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class maxDepth {
    static func solution(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(solution(root?.left), solution(root?.right)) + 1
    }
}
