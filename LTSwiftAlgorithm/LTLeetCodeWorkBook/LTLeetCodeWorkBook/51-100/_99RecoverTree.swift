//
//  _99RecoverTree.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/20.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RecoverTree {
    static func solution(_ root: TreeNode?) {
        var preNode = TreeNode(Int.min)
        var node1: TreeNode?
        var node2: TreeNode?
        func traverse(_ treeNode: TreeNode?) {
            if treeNode == nil {return}
            
            traverse(treeNode?.left)
            
            if preNode.val > treeNode!.val {
                if node1 == nil {
                    node1 = preNode
                    node2 = treeNode!
                } else {
                    node2 = treeNode!
                    return
                }
            }
            preNode = treeNode!
            
            traverse(treeNode?.right)
        }
        
        traverse(root)
        
        if node1 != nil, node2 != nil {
            let val = node1!.val
            node1!.val = node2!.val
            node2!.val = val
        }
    }
    
    static func solution1(_ root: TreeNode?) {
        var stack = [TreeNode]()
        var node1: TreeNode?
        var node2: TreeNode?
        func traverse(_ treeNode: TreeNode?) {
            if treeNode == nil {return}
            traverse(treeNode?.left)
            
            stack.append(treeNode!)
            traverse(treeNode?.right)
        }
        traverse(root)
        
        for i in 0..<stack.count {
            if i < stack.count - 1 && stack[i].val > stack[i+1].val, node1 == nil {
                node1 = stack[i]
                break
            }
        }
        
        for j in 0..<stack.count {
            let i = stack.count - 1 - j
            if i > 0 && stack[i].val < stack[i-1].val, node2 == nil {
                node2 = stack[i]
                break
            }
        }
        
        
        if node1 != nil, node2 != nil {
            let val = node1!.val
            node1!.val = node2!.val
            node2!.val = val
        }
        
    }
}
