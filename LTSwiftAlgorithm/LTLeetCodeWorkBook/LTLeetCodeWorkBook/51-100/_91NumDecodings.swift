//
//  _91NumDecodings.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/19.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class NumDecodings {
    static func solution(_ s: String) -> Int {
        let arr = Array(s)
        var memo = [Int?]()
        for i in 0...arr.count {
            memo.append(nil)
        }
        var len = arr.count

        
        func _solution(from l:Int) -> Int {
            if memo[l] != nil {
                return memo[l]!
            }
            var ans = 0
            if l > len-1 {
                ans = 0
            } else if arr[l] == "0" {
                ans = 0
            } else if l == len-1 {
                ans = 1
            } else if l == len-2 {
                let sumOfTwoChar = (arr[l].wholeNumberValue!) * 10 + Int(arr[l+1].wholeNumberValue!)
                if arr[len-1] == "0" {
                    if sumOfTwoChar < 27 {
                        ans = 1
                    } else {
                        ans = 0
                    }
                } else {
                    if sumOfTwoChar < 27 {
                        ans = 2
                    } else {
                        ans = 1
                    }
                }
            } else {
                let sumOfTwoChar = (arr[l].wholeNumberValue!) * 10 + Int(arr[l+1].wholeNumberValue!)
                if sumOfTwoChar < 27 {
                    ans = _solution(from: l+1) + _solution(from: l+2)
                } else {
                    ans = _solution(from: l+1)
                }
            }
            memo[l] = ans
            
            return memo[l]!
            
        }
        return _solution(from: 0)

        
    }
}
