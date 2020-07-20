//
//  _86Partition.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/18.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Partition {
    static func solution(_ head: ListNode?, _ x: Int) -> ListNode? {
        var lNode :ListNode? = ListNode(0)
        var rNode :ListNode? = ListNode(0)
        
        let lHead = lNode, rHead = rNode
        
        var temp = head
        
        while temp != nil {
            if temp!.val < x {
                lNode?.next = temp
                lNode = lNode!.next
            } else {
                rNode?.next = temp
                rNode = rNode!.next
            }
            temp = temp?.next
        }
        rNode?.next = nil
        
        lNode?.next = rHead?.next
        
        return lHead?.next
    }
}
