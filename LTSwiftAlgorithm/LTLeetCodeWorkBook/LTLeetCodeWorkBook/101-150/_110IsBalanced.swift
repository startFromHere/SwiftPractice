//
//  _110IsBalanced.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/5.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class IsBalanced {
    static func solution(_ root: TreeNode?) -> Bool {
        func depth(of node: TreeNode?) -> Int {
            if node == nil {
                return 0
            } else {
                return 1 + max(depth(of: node?.left), depth(of: node?.right))
            }
        }
        
        func _isBalanced(_ node: TreeNode?) -> Bool {
            if node == nil {
                return true
            } else {
                if abs(depth(of: node?.left) - depth(of: node?.right)) <= 1 {
                    return _isBalanced(node?.left) && _isBalanced(node?.right)
                } else {
                    return false
                }
            }
        }
        
        return _isBalanced(root)
    }
}
