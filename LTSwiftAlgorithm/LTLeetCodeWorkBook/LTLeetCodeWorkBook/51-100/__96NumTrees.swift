//
//  _96NumTrees.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/18.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class NumTrees {
    static func solution(_ n: Int) -> Int {
        var memo = [[Int]]()
        for i in 0...n {
            memo.append([Int]())
            for j in 0...n {
                memo[i].append(0)
            }
        }
        func _solution(from left:Int, to right:Int) -> Int {
            if left > right {return 1}
            if memo[left][right] > 0 {
                return memo[left][right];
            }
            
            var ans = 0
            if left >= right {
                memo[left][right] = 1
            } else {
                var sum = 0
                for i in left...right {
                    sum += _solution(from: left, to: i-1) * _solution(from: i+1, to: right)
                }
                memo[left][right] = sum
            }
            return memo[left][right]
        }
        
        if n == 0 {return 0}
        return _solution(from: 1, to: n)
    }
}
