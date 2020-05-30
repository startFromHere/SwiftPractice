//
//  _21MergeTwoLists.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/5.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}

class MergeTwoLists{
    
    class func solution(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        let head = ListNode(0)
        var currentNode = head
        while node1 != nil || node2 != nil {
            if node1 == nil {
                currentNode.next = node2!
                node2 = node2?.next
            } else if node2 == nil {
                currentNode.next = node1!
                node1 = node1?.next
            } else {
                if node1!.val < node2!.val {
                    currentNode.next = node1
                    node1 = node1?.next
                } else {
                    currentNode.next = node2
                    node2 = node2?.next
                }
            }
            currentNode = currentNode.next!
        }
        return head.next
    }
}
