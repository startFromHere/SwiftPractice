//
//  AddTwoNums.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/4/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class AddTwoNums {
    class func solution(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //1.遍历方式
        var carry:Int = 0
        var tempNode1 = l1, tempNode2 = l2
        while (tempNode1 != nil || tempNode2 != nil) {
            let node = tempNode1 ?? tempNode2
            let val = ((tempNode1?.val ?? 0) + (tempNode2?.val ?? 0) + carry)
            print("val1:\(tempNode1?.val) val2:\(tempNode2?.val) val:\(val)")
            node?.val = val%10
            carry = val/10
            
            if tempNode1?.next == nil && tempNode2?.next == nil && carry > 0 {
                tempNode1?.next = ListNode(carry)
                return tempNode1
            } else {
                let nextNode = tempNode1?.next ?? tempNode2?.next
                tempNode1?.next = nextNode
                tempNode1 = nextNode
                if !(nextNode === tempNode2?.next) {
                    tempNode2 = tempNode2?.next
                } else {
                    tempNode2 = nil
                }
                
            }
            
            
        }
        
        var tempNode = l1
        while let n = tempNode {
            print("\(n.val)")
            tempNode = tempNode?.next
        }
        
        return tempNode1
        
        
        //2.递归方式
//        return ltSolution(l1, l2, 0)
    }
    
    class func ltSolution(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
        if l1 == nil && l2 == nil {
            if carry != 0 {
                return ListNode(carry)
            }
            return nil
        }
        
        let node = ListNode(0)
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        node.val = sum % 10
        let carryNum = sum / 10
        
        node.next = ltSolution(l1?.next, l2?.next, carryNum)
        
        print("\(node.val)")
        return node
    }
}
