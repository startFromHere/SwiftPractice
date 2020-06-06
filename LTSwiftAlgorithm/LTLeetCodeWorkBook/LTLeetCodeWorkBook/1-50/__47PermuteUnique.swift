//
//  _47PermuteUnique.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/3.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class PermuteUnique {
    class func solution(_ nums: [Int]) -> [[Int]] {
        
        if nums.count == 0 {return []}
        var arr = nums.sorted()
        var used = Array.init(repeating: false, count: arr.count)
        var list = [Int]()
        var ans = [[Int]]()
        
        func dfs(depth:Int) {
            if depth == arr.count {
                ans.append(list)
                return
            }
            
            for i in 0..<arr.count {
                if used[i] {
                    continue
                }
                
                if (i > 0 && arr[i] == arr[i-1] && !used[i-1]) {
                    continue
                }
                
                list.append(arr[i])
                used[i] = true
                
                dfs(depth:depth + 1)
                used[i] = false
                list.removeLast()
            }
        }
        
        dfs(depth: 0)
        
        
        return ans
        
    }
}
