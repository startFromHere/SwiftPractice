//
//  TwoSum.swift
//  LTSwiftAlgorithm
//
//  Created by 移动支付－刘涛 on 2018/10/24.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class TwoSum: LeetcodeSolution {
    override func solution() {
        let nums = [2, 7, 11, 15]
        let target = 9
        let result = TwoSum.twoSum(nums, target)
    }
}

extension LeetcodeSolution{
    class func twoSum(_ array:[Int], _ target:Int) -> [Int] {
        var tempDic = [Int : Int]()
        for (currentIndex, currentValue) in array.enumerated() {
            if let matchIndex = tempDic[target - currentValue] {
                return [matchIndex,currentIndex]
            }
            tempDic[currentValue] = currentIndex
        }
        return []
    }
}
