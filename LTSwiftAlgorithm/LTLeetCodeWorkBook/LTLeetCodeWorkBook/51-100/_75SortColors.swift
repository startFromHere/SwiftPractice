//
//  _75SortColors.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/28.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SortColors {
    static func solution(_ nums: inout [Int]){
        
        var idx0 = 0, idx1 = 0, idx2 = nums.count - 1
        while idx1 <= idx2  {
            if nums[idx1] == 1 {
                idx1 += 1
            } else if nums[idx1] == 0 {
                nums.swapAt(idx0, idx1)
                idx0 += 1
                idx1 += 1
                
            } else if nums[idx1] == 2 {
                nums.swapAt(idx1, idx2)
                idx2 -= 1
            }
        }
    }
}
