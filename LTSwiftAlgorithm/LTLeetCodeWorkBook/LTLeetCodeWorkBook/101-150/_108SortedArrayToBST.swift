//
//  _108SortedArrayToBST.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/27.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SortedArrayToBST {
    static func solution(_ nums: [Int]) -> TreeNode? {
        func rootNode(from left: Int, to right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            let mid = (left + right) >> 1
            let node = TreeNode(nums[mid])
            node.left = rootNode(from: left, to: mid - 1)
            node.right = rootNode(from: mid + 1, to: right)
            return node
        }
        
        return rootNode(from: 0, to: nums.count - 1)
    }
}
