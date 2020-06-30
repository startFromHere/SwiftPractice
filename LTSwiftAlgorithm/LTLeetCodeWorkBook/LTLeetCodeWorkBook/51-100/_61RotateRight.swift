//
//  _61RotateRight.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class RotateRight {
    static func solution(_ head: ListNode?, _ k: Int) -> ListNode? {
        var lNode = head, rNode = head
        var myHead: ListNode?
        for _ in 0..<k{
            if rNode?.next != nil {
                rNode?.next = head
                myHead = lNode?.next
                lNode?.next = nil
                return myHead
            }
        }
        
        while true {
            if rNode?.next == nil {
                rNode?.next = head
                myHead = lNode?.next
                lNode?.next = nil
                break
            } else {
                lNode = lNode?.next
                rNode = rNode?.next
            }
        }
        
        return myHead
    }
    
    static func solution1(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        var stack = [ListNode?]()
        
        var node = head
        while node != nil {
            stack.append(node)
            node = node?.next
        }
        
        let ans = stack.last!
        node = ans
        for _ in 0..<k {
            if stack.count == 0 {
                break
            }
            node?.next = stack.removeLast()!
            node = node?.next
        }
        
        while stack.count > 0 {
            node?.next = stack.removeFirst()!
            node = node?.next
        }
        
        return ans
    }
}
