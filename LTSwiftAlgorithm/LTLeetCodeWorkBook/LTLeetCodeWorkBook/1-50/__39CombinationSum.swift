//
//  _39CombinationSum.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/28.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class CombinationSum {
    class func solution(_ candidates: [Int], _ target: Int) -> [[Int]] {
        func _solution(from left:Int, to right:Int, target targetValue:Int) -> [[Int]] {
            var ans = [[Int]]()
            if left > right {return ans}
            
            for i in 0...targetValue/candidates[left] {
                let temAns = _solution(from: left+1, to: right, target: targetValue - i*candidates[left])
                if i > 0 && i*candidates[left] == targetValue {
                    ans.append(Array.init(repeating: candidates[left], count: i))
                }
                for arr in temAns  {
                    var temArr = Array.init(repeating: candidates[left], count: i)
                    temArr.append(contentsOf: arr)
                    ans.append(temArr)
                }
                
            }
            
            return ans
        }
        
        return _solution(from: 0, to: candidates.count - 1, target: target)
    }
}
