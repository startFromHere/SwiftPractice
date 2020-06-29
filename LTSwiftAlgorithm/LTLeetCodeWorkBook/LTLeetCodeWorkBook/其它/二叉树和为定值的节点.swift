//
//  二叉树和为定值的节点.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/28.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class BinaryTreeNode {
    class func solution(root: TreeNode?, target:Int) -> [[Int]] {
        var ans:[[Int]] = []
        func findValue(baseOn parentValues: [Int], currentNode node: TreeNode?, targetValue value: Int){
            if node == nil {
                return
            }
            
            var arr = parentValues
            arr.append(node!.val)
            
            if node?.val == value {
                ans.append(arr)
            }
            
            findValue(baseOn: parentValues, currentNode: node?.left, targetValue: value)
            findValue(baseOn: parentValues, currentNode: node?.right, targetValue: value)
            
            findValue(baseOn: arr, currentNode: node?.left, targetValue: value - node!.val )
            findValue(baseOn: arr, currentNode: node?.right, targetValue: value - node!.val )
        }
        
        findValue(baseOn: [], currentNode: root, targetValue: target)
        return ans;
    }
}
