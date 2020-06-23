//
//  _101IsSymmetric.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/22.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class isSymmetric {
    static func solution(_ root: TreeNode?) -> Bool {
        var queue = [Int]()
        
        
        func _solution(_ tree1: TreeNode?, _ tree2: TreeNode?) -> Bool {
            if tree1 == nil, tree2 == nil {
                return true
            }
            if tree1?.val != tree2?.val {
                return false
            } else {
                return _solution(tree1?.left, tree2?.right) && _solution(tree1?.right, tree2?.left)
            }
        }
        
        return _solution(root?.left, root?.right)
    }
    
    
    static func solution1(_ root: TreeNode?) -> Bool {
        func _solution(_ tree1: TreeNode?, _ tree2: TreeNode?) -> Bool {
            if tree1 == nil, tree2 == nil {
                return true
            }
            if tree1?.val != tree2?.val {
                return false
            } else {
                return _solution(tree1?.left, tree2?.right) && _solution(tree1?.right, tree2?.left)
            }
        }
        
        return _solution(root?.left, root?.right)
    }
}
