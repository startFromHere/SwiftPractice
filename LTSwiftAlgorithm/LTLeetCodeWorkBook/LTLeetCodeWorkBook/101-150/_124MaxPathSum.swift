//
//  _124MaxPathSum.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/3.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MaxPathSum {
    
    static func solution(_ root: TreeNode?) -> Int {
        var ans = Int.min
        
        func foo(_ node: TreeNode?) -> Int {
            if node == nil {
                return 0
            }
            let maxLeft = max(0, foo(node?.left))
            let maxRight = max(0, foo(node?.right))
            ans = max(ans, node!.val + maxLeft + maxRight)
            return node!.val + max(0, max(maxLeft, maxRight))
        }
        
        _ = foo(root)
        
        return ans
    }
}
