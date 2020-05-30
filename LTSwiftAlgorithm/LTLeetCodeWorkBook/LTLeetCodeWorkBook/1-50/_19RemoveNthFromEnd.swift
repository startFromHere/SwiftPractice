//
//  _19RemoveNthFromEnd.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/12.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RemoveNthFromEnd {
    class func solution(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n <= 0 {return head}
        
        let newHead = ListNode(0)
        newHead.next = head
        var l:ListNode? = newHead
        var r:ListNode? = newHead
        
        for _ in 0...n-1 {
            r = r?.next
            if r == nil {
                return nil
            }
        }
        
        while r?.next != nil {
            r = r?.next
            l = l?.next
        }
        
        l?.next = l?.next?.next
        
        return newHead.next
    }
}
