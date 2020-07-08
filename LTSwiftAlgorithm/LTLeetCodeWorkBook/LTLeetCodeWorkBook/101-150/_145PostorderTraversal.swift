//
//  _145PostorderTraversal.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/4.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class postorderTraversal {
    
    static func solution(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var stack = [TreeNode]()
        var ans = [Int]()
        stack.append(root!)
        
        while stack.count != 0 {
            let node = stack.removeLast()
            ans.insert(node.val, at: 0)
            if node.left != nil {
                stack.append(node.left!)
            }
            if node.right != nil {
                stack.append(node.right!)
            }
        }
        return ans
    }
    
    static func solution1(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        
        func _solution(_ node: TreeNode?) {
            if node == nil {
                return
            }
            
            if node!.left != nil {
                _solution(node!.left)
            }
            if node?.right != nil {
                _solution(node!.right)
            }
            ans.append(node!.val)
        }
        
        return ans
    }
}
