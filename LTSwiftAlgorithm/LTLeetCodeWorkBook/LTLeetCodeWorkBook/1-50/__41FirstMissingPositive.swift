//
//  _41FirstMissingPositive.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class FirstMissingPositive {
    class func solution(_ nums: [Int]) -> Int {
        
        if !nums.contains(1) {
            return 1
        }
        
        var arr = nums
        for i in 0..<arr.count {
            if arr[i] <= 0 {
               arr[i] = 1
            }
            
            if arr[i] > nums.count {
                arr[i] = 1
            }
        }
        
        var index:Int
        for i in 0..<arr.count {
            index = abs(arr[i])
            if index == arr.count {
                index = 0
            }
            if arr[index] > 0 {
                arr[index] *= -1
            }
        }
        
        
        for i in 1..<arr.count {
            if arr[i] > 0 {
                return i
            }
        }
        
        if arr[0] > 0 {
            return arr.count
        }
        
        return arr.count + 1
    }
}
