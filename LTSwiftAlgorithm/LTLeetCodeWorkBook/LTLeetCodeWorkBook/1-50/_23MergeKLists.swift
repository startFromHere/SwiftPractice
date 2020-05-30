//
//  _23MergeKLists.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/19.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class mergeKLists {
    class func solution(_ lists: [ListNode?]) -> ListNode? {
        
        if lists.count == 0 {return nil}
        
        var myList = lists.filter {
            $0 != nil
        } as! [ListNode]
        
        let head = ListNode.init(0)
        var currentHead = head
        var tempHead = ListNode.init(Int.max)
        var index = 0
        while myList.count > 0 {
            for i in 0..<myList.count {
                if tempHead.val > myList[i].val {
                    tempHead = myList[i]
                    index = i
                }
            }
            currentHead.next = tempHead
            currentHead = tempHead
            guard let next = tempHead.next else {
                myList.remove(at: index)
                if myList.count > 0 {
                    tempHead = myList.last!
                    index = myList.count - 1
                }
                continue
            }
            
            if next === tempHead {
                print("wtf")
            }
            
            tempHead = next
            myList[index] = next
        }
        
        return head.next
    }
    
}
