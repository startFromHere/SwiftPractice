//
//  _106BuildTree1.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/26.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class BuildTree1 {
    static func solution(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        func _solution(from left:Int, to right:Int, target val:Int) -> TreeNode? {
            
            let node = TreeNode(val)
        
            var idx = left
            for i in left...right {
                if  inorder[i] == val {
                    idx = i
                }
            }
            if idx > left {
                node.left = _solution(from: left, to: idx - 1, target:inorder[idx - 1])
            }
            
            if idx < right {
                node.right = _solution(from: idx+1, to: idx + 1, target:postorder[right - 1])
            }
            
            return node
        }
        
        
        if postorder.count == 0 {return nil}
        return _solution(from: 0, to: postorder.count - 1, target: postorder.last!)
    }
}
