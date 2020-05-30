//
//  _11MaxArea.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/8.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MaxArea{
    
    class func solution(_ height: [Int]) -> Int {
        if height.count <= 1 {return 0}
        var l = 0
        var r = height.count - 1
        var maxArea = min(height[l], height[r]) * (r - l)
        var tempArea = 0
        while l < r {
            if l == r - 1 {
                tempArea = min(height[l], height[r])
                l += 1
            } else {
                if height[l] <= height[r] {
                    l += 1
                } else {
                    r -= 1
                }
                tempArea = min(height[l], height[r]) * (r - l)
            }
            if tempArea > maxArea {
                maxArea = tempArea
            }
        }
        
        return maxArea
    }
}
