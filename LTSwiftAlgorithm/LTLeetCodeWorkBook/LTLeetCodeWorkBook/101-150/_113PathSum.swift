//
//  _113PathSum.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/6.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class PathSum {
    static func solution(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var ans = [[Int]]()
        var temp = [Int]()
        
        func _solution(_ root: TreeNode?, _ sum: Int) -> Bool{
            if root == nil {
                return false
            } else if root?.left == nil , root?.right == nil {
                temp.append(root!.val)
                var result = root!.val == sum
                if result{
                    ans.append(temp)
                }
                temp.removeLast()
                return result
            } else {
                temp.append(root!.val)
                let resultLeft = _solution(root?.left, sum - root!.val)
                let resultRight = _solution(root?.right, sum - root!.val)
                let result = resultLeft || resultRight
                temp.removeLast()
                return result
            }
        }

        _solution(root, sum)
        
        return ans
    }
}
