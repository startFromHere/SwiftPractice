//
//  _92ReverseBetween.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/15.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class ReverseBetween {
    static func solution(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let viturHead = ListNode.init(0)
        viturHead.next = head
        var stack = [ListNode]()
        var count = 0
        var currentNode:ListNode = viturHead
        var preNodel = viturHead
        
        while count <= n {
            if count >= m && count <= n {
                stack.append(currentNode)
            }
            if count == m - 1 {
                preNodel = currentNode
            }
            if count == n {
                let postNode = currentNode.next
                while stack.count > 0 {
                    let lastNode = stack.removeLast()
                    preNodel.next = lastNode
                    preNodel = lastNode
                }
                preNodel.next = postNode
                break
            }
            
            count += 1
            if currentNode.next != nil {
                currentNode = currentNode.next!
            }
        }
        
        return viturHead.next
        
    }
}
