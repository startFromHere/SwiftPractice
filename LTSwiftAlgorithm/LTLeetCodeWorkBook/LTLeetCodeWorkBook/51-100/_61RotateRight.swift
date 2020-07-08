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
        if k == 0 {return head}
        
        var len = 1
        var node = head
        var idx = 0
        while node?.next != nil {
            node = node?.next
            len += 1
        }
        
        node?.next = head
        
        if len <= k {
            idx = len - 1 - k % len
        } else {
            idx = len - 1 - k
        }
        
        node = head
        for _ in 0..<idx {
            node = node?.next
        }
        
        let ans = node?.next
        node?.next = nil
        
        return ans
        
        
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
