//
//  _112HasPathSum.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/6.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class hasPathSum {
    static func solution(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        } else if root?.left == nil && root?.right == nil {
            return root!.val == sum
        } else {
            return solution(root?.left, sum - root!.val) || solution(root?.right, sum - root!.val)
        }
    }
}
