//
//  _100IsSameTree.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/22.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class IsSameTree {
    static func solution(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        var pQueue = [p]
        var qQueue = [q]
        while pQueue.count > 0 {
            let pHead = pQueue.removeFirst()
            let qHead = qQueue.removeFirst()
            if pHead?.val != qHead?.val {
                return false
            } else {
                if pHead?.left?.val != qHead?.left?.val {
                    return false
                } else if pHead?.left != nil, qHead?.left != nil {
                    if pHead?.left!.val != qHead?.left!.val {
                        return false
                    }
                    pQueue.append(pHead?.left)
                    qQueue.append(qHead?.left)
                }
                
                if pHead?.right?.val != qHead?.right?.val {
                    return false
                } else if qHead?.right != nil, qHead?.right != nil {
                    if pHead?.right!.val != qHead?.right!.val {
                        return false
                    }
                    pQueue.append(pHead?.right)
                    qQueue.append(qHead?.right)
                }
            }
        }
        
        return true
    }
    
    static func solution2(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p?.val == q?.val {
            return solution(p?.left, q?.left) && solution(p?.right, q?.right)
        } else {
            return false
        }
    }
}
