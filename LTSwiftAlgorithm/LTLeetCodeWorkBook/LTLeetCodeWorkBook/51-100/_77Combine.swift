//
//  _77Combine.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/14.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Combine {
    
    static func solution(_ n: Int, _ k: Int) -> [[Int]] {
        var ans:[[Int]] = []
        var temp = [Int]()
        
        func backtrack(at idx: Int) {
            
            if temp.count == k {
                ans.append(temp)
                return
            }
            if idx > n {
                return
            }
            for i in idx...n {
                temp.append(i)
                backtrack(at: i+1)
                temp.removeLast()
            }
        }
        
        backtrack(at: 1)
        
        return ans;
    }
    
    
    static func solution1(_ n: Int, _ k: Int) -> [[Int]] {
        var ans:[[Int]] = []
        func helper(from start: Int, temp arr:[Int], remain count:Int) {
            
            if count == 0 {
                ans.append(arr)
            } else {
                if start > n || count < 0 {
                  return
                }
                helper(from: start + 1, temp: arr, remain: count)
                var arrWithCurrentNum  = arr
                arrWithCurrentNum.append(start)
                helper(from: start + 1, temp: arrWithCurrentNum, remain: count - 1)
            }
        }
        
        helper(from: 1, temp: [], remain: k)
        
        return ans;
    }
}
