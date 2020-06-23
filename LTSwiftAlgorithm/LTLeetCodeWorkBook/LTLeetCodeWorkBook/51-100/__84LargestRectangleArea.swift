//
//  _84LargestRectangleArea.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/17.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class LargestRectangleArea {
    static func solution(_ heights: [Int]) -> Int {
        var stack = [Int]()
        var arr = heights
        arr.append(0)
        var ans = 0
        for i in 0..<arr.count {
            while stack.last != nil, arr[stack.last!] > arr[i] {
                let lastIndex = stack.removeLast()
                var curLastIndex = 0
                if stack.last != nil {
                    curLastIndex = stack.last! + 1
                }
                ans = max(ans, (i - curLastIndex) * arr[lastIndex])
            }
            stack.append(i)
        }
        
        
        return ans;
    }
}
