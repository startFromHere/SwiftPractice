//
//  AddTwoNumbers.swift
//  LTSwiftAlgorithm
//
//  Created by 移动支付－刘涛 on 2018/10/24.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    func describe(){
        var currentNode : ListNode = self
        print("value->\(currentNode.val)")
        while let nextNode = currentNode.next {
            print("value->\(nextNode.val)")
            currentNode = nextNode
        }
    }
}

class AddTwoNumbers:LeetcodeSolution {
     override func solution() {
        let l1 = ListNode(5)
        l1.next = ListNode(4)
        l1.next?.next = ListNode(3)
        
        let l2 = ListNode(5)
        l2.next = ListNode(6)
        l2.next?.next = ListNode(4)
        
        print("L1:");
        l1.describe()
        
        print("L2:");
        l2.describe()
        
        let resultL = AddTwoNumbers.addTwoNumbers(l1, l2)
    }
    
    
}

extension LeetcodeSolution{
    class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        
        var tempL1 = l1
        var tempL2 = l2
        
        let resultL = ListNode(0)
        var currentNode :ListNode? = resultL
        while (tempL1 != nil) || (tempL2 != nil) {
            var l1NodeVal = 0, l2NodeVal = 0
            if let currentL1Node = tempL1 {
                l1NodeVal = currentL1Node.val
                tempL1 = tempL1?.next
            }
            if let currentL2Node = tempL2 {
                l2NodeVal = currentL2Node.val
                tempL2 = tempL2?.next
            }
            currentNode?.val = l1NodeVal + l2NodeVal
            
            if tempL1 != nil || tempL2 != nil {
                currentNode?.next = ListNode(0);
                currentNode = currentNode?.next!
            }
        }
        
        currentNode = resultL
        while currentNode != nil {
            let currentNodeVal = currentNode?.val ?? 0
            if currentNodeVal >= 10 {
                currentNode?.val = currentNodeVal % 10
                var nextNode = currentNode?.next
                if nextNode == nil {
                    nextNode = ListNode(0)
                    currentNode?.next = nextNode
                }
                nextNode?.val += currentNodeVal / 10
            }
            if let nextNode = currentNode?.next {
                currentNode = nextNode
            } else {
                currentNode = nil
            }
        }
        
        return resultL
    }
}
