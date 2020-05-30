//
//  _40CombinationSum2.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/28.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class CombinationSum2 {
    
    class func solution(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var sortedCandidates = candidates.sorted()
        var ans = [[Int]]()
        func _solution() {
            _solution2(from: 0, preArr: [Int](), target: target)
        }
        
        func _solution2(from left:Int, preArr arr:[Int], target targetValue:Int) {
            
            if left > candidates.count - 1 || targetValue < sortedCandidates[left] {return}
            
            var tempArr = arr
            if sortedCandidates[left] == targetValue {
                tempArr.append(targetValue)
                ans.append(tempArr)
            } else {
                //include current value
                tempArr.append(sortedCandidates[left])
                _solution2(from: left+1, preArr: tempArr, target: targetValue - sortedCandidates[left])
                
                //not include current value
                _solution2(from: left+1, preArr:arr, target: targetValue)
            }
        }
        
        _solution()
        
        ans = ans.map({$0.sorted()})
        ans = Array(Set.init(ans))
        return ans
    }
}
