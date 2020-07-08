//
//  _144PreorderTraversal.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/4.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class PreorderTraversal {
    
    static func solution(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var queue = [TreeNode]()
        queue.append(root!)
        var ans = [Int]()
        
        while queue.count > 0 {
            let node = queue.removeFirst()
            if node.right != nil {
                queue.insert(node.right!, at: 0)
            }
            if node.left != nil {
                queue.insert(node.left!, at: 0)
            }
            ans.append(node.val)
        }
        
        return ans
    }
    
    static func solution1(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        
        func _solution(_ node: TreeNode?) {
            if node == nil {
                return
            }
            ans.append(node!.val)
            
            if node!.left != nil {
                _solution(node!.left)
            }
            
            if node!.right != nil {
                _solution(node!.right)
            }
        }
        
        _solution(root)
        
        return ans
    }
}
