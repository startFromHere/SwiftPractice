//
//  _98IsValidBST.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/18.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class isValidBST {
    static func solution(_ root: TreeNode?) -> Bool {
        var stack = [Int]()
        
        func traverse(_ node: TreeNode?) -> Bool{
            if node == nil {return true}
            if !traverse(node?.left) {
                return false
            }
            if stack.last != nil, stack.last! > node!.val {
                return false
            }
            stack.append(node!.val)
            
            return traverse(node?.left)
        }
        
        return traverse(root)
    }
}
