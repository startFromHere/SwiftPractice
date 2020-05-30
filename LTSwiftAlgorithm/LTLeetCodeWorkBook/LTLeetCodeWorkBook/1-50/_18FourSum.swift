//
//  _18FourSum.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/11.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class FourSum {
    class func solution(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {return []}
        var ans = [[Int]]()
        let arr = nums.sorted()
        var l = 0
        var r = 0
        var sum = arr[0] + arr[1] + arr[2] + arr[3]
        for i in 0 ... arr.count - 4 {
            if i > 0 && arr[i] == arr[i-1] {
                continue
            }
            for j in i+1 ... nums.count - 3 {
                if j > i+1 && arr[j] == arr[j-1] {
                    continue
                }
                
                l = j+1
                r = nums.count - 1
                while l < r {
                    sum = arr[i] + arr[j] + arr[l] + arr[r]
                    if sum == target {
                        ans.append([arr[i], arr[j], arr[l], arr[r]])
                        l += 1
                        while arr[l] == arr[l-1] && r > l  {
                            l += 1
                        }
                        
                    }
                    if sum < target {
                        l += 1
                    } else {
                        r -= 1
                    }
                }
            }
        }
        return ans
    }
}
