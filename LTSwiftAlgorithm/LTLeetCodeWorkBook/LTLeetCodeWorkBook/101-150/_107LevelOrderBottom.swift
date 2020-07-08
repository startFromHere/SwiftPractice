//
//  _107LevelOrderBottom.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/27.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class levelOrderBottom {
    static func solution(_ root: TreeNode?) -> [[Int]] {
        var stack = [TreeNode?]()
        var ans = [[Int]]()
        var currentArr = [Int]()
        if root == nil {
            return []
        }
        stack.append(root)
        
        var currentLastNode = root!
        while stack.count > 0 {
            let headNode = stack.removeFirst()
            currentArr.append(headNode!.val)
            
            if headNode?.left != nil {
                stack.append(headNode?.left)
                
            }
            if headNode?.right != nil {
                stack.append(headNode?.right)
            }
            
            if currentLastNode === headNode {
                ans.append(currentArr)
                currentArr = [Int]()
                if stack.last != nil {
                    currentLastNode = stack.last!!
                }
            }
        }
        
        ans = ans.reversed()
        return ans
    }
}
