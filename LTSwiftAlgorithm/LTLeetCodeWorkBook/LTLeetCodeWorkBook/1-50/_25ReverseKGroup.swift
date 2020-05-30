//
//  _25ReverseKGroup.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/20.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class reverseKGroup {
    class func solution(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {return nil}
        if k <= 1 {return head}
        
        let ans = ListNode.init(0)
        ans.next = head
        
        var tempNode = head
        var tailInGroup = ans
        var nodesArr = [ListNode]()
        
        while tempNode != nil  {
            
            nodesArr.append(tempNode!)
            tempNode = tempNode?.next
            
            if nodesArr.count == k {
                for i in stride(from: k-1, to: 0, by: -1) {
                    nodesArr[i].next = nodesArr[i-1]
                }
                tailInGroup.next = nodesArr[k-1]
                tailInGroup = nodesArr[0]
                tailInGroup.next = tempNode
                nodesArr.removeAll()
            }
            
        }
        
        return ans.next
    }
}
