//
//  _94InorderTraversal.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/14.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class InorderTraversal {
    
    static func solution(_ root: TreeNode?) -> [Int] {
        
        var ans = [Int]()
        
        func _solution(_ _root: TreeNode?) {
            if _root == nil {
                return
            }
            _solution(_root?.left)
            ans.append(_root!.val)
            _solution(_root?.right)
        }

        _solution(root)
        
        return ans
    }
}
