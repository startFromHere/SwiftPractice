//
//  _105BuildTree.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/23.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class BuildTree {
    static func solution(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
//        func _solution(from left:Int, to right:Int) -> TreeNode? {
//            if left == right {
//                return TreeNode(preorder[left])
//            } else {
//                
//            }
//        }
        
        if preorder.count == 0 {return nil}
        let node = TreeNode(preorder[0])
        var idx = 0
        for i in 0..<inorder.count {
            if  inorder[i] == preorder[0] {
                idx = i
            }
        }
        
        var subPreorder: [Int] = []
        var subInorder: [Int] = []
        if idx > 0 {
            subPreorder = [Int](preorder[1...idx])
            subInorder = [Int](inorder[0...idx-1])
            node.left = solution(subPreorder, subInorder)
        }
        
        if idx < inorder.count - 1 {
            subPreorder = [Int](preorder[idx+1...inorder.count - 1])
            subInorder = [Int](inorder[idx+1...inorder.count - 1])
            node.right = solution(subPreorder, subInorder)
        }
        
        return node
    }
    
    static func solution1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 {return nil}
        let node = TreeNode(preorder[0])
        var idx = 0
        for i in 0..<inorder.count {
            if  inorder[i] == preorder[0] {
                idx = i
            }
        }
        
        var subPreorder: [Int] = []
        var subInorder: [Int] = []
        if idx > 0 {
            subPreorder = [Int](preorder[1...idx])
            subInorder = [Int](inorder[0...idx-1])
            node.left = solution(subPreorder, subInorder)
        }
        
        if idx < inorder.count - 1 {
            subPreorder = [Int](preorder[idx+1...inorder.count - 1])
            subInorder = [Int](inorder[idx+1...inorder.count - 1])
            node.right = solution(subPreorder, subInorder)
        }
        
        return node
    }
}
