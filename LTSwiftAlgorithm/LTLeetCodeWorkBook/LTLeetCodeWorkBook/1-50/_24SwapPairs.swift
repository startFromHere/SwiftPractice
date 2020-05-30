//
//  _24SwapPairs.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/16.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class swapPairs {
    //递归
    class func colution(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {return head}
        
        let next = head?.next
        let tempHead = head
        tempHead?.next = next?.next
        next?.next = tempHead
        tempHead?.next = colution(tempHead?.next)
        
        return next
    }
    //迭代……
}
