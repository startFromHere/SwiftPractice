//
//  _60GetPermutation.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/9.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class GetPermutation {
    
    static func solution(_ n: Int, _ k: Int) -> String {
        
        func factorial(num: Int) -> Int {
            if num <= 1 {
                return 1
            }
            var res = 1
            for i in 1...num {
                res *= i
            }
            return res
        }
        
        var nums = [Int]()
        for i in 0..<n {
            nums.append(i+1)
        }
        
        var ans = ""
        var kValue = k-1
        for i in 0..<n {
            let key = factorial(num: n - i - 1)
            let index = kValue/key
            ans.append("\(nums[index])")
            nums.remove(at: index)
            kValue %= key
        }
        
        return ans;
    }
}
