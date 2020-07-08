//
//  _109SortedListToBST.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/2.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SortedListToBST {
    static func solution(_ head: ListNode?) -> TreeNode? {
        var arr = [ListNode?]()
        var node = head
        while node != nil {
            arr.append(node)
            node = node?.next
        }
        if arr.count == 0 {
            return nil
        }
        
        func _solution(from left:Int, to right:Int) -> TreeNode? {
            if left > right {
                return nil
            }
            if left == right {
                return TreeNode(arr[left]!.val)
            }
            let mid = (left + right) / 2
            let listNode = arr[mid]
            var treeNode = TreeNode(listNode!.val)
            treeNode.left = _solution(from: left, to: mid - 1)
            treeNode.right = _solution(from: mid + 1, to: right)
            return treeNode
        }
        
        return _solution(from: 0, to: arr.count - 1)
    }
}
