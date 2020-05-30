//
//  _32LongestValidParentheses.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/24.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class longestValidParentheses {
    class func solution(_ s: String) -> Int {
        let arr = Array(s)
        
        func _solution(_ arr:Array<Character>,direction isLToR:Bool) -> Int {
            if arr.count == 0 {return 0}
            var ans = 0, len = 0, sum = 0
            //left to right
            let flag:Character = isLToR ? "(" : ")"
            let indexes = isLToR ? Array(0...arr.count-1) : Array((0...arr.count-1).reversed())
            for i in indexes {
                len += 1
                sum += (arr[i] == flag) ? 1 : -1
                if sum < 0 {
                    sum = 0
                    len = 0
                } else if sum == 0 {
                    ans = max(ans, len)
                }
            }
            return ans
        }
        
        let ans = max(_solution(arr, direction: true), _solution(arr, direction: false))
        
        return ans
    }
}
