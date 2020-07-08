//
//  _111MinDepth.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/8.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MinDepth {
    static func solution(_ root: TreeNode?) -> Int {
        
        func _solution(_ node: TreeNode) -> Int {
            if node.left == nil, node.right == nil {
                return 1
            } else if node.left == nil {
                return _solution(node.right!) + 1
            } else if node.right == nil {
                return _solution(node.left!) + 1
            } else {
                return min(_solution(node.left!), _solution(node.right!)) + 1
            }
        }
        
        if root == nil {
            return 0
        }
        
        return _solution(root!)
    }
}
