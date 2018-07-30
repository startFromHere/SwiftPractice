//
//  AlgorithVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/30.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class AlgorithVC: LTBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = [1,2, 3, 4, 4, 7, 8, 9, 10, 12, 14, 21, 22, 100]
        
        if let value = twoSum2(a, target: 24) {
            print("value:%@   left:%d  right:%d",value,a[value.0],a[value.1])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func twoSum1(_ nums: [Int], target:Int) ->(Int, Int)? {
        var dic = [Int: Int]()
        
        for (currentIndex, n) in nums.enumerated() {
            let complement = target - n
            
            if let complementIndex = dic[complement] {
                return (complementIndex, currentIndex)
            }
            
            dic[n] = currentIndex
        }
        return nil
    }
    
    func twoSum2(_ nums: [Int], target:Int) -> (Int,Int)? {
        var leftIndex = 0, rightIndex = nums.count - 1
        var tempDic = [Int: Int]()
        
        while leftIndex < rightIndex {
            let leftValue = nums[leftIndex]
            let rightValue = nums[rightIndex]
            if leftValue + rightValue == target {
                return (leftIndex, rightIndex)
            } else {
                if let complementIndex = tempDic[target - leftValue] {
                    return (leftIndex, complementIndex)
                } else if let complementIndex = tempDic[target - rightValue] {
                    return (complementIndex, rightIndex)
                }
            }
            tempDic[leftValue] = leftIndex
            tempDic[rightValue] = rightIndex
            leftIndex += 1
            rightIndex -= 1
        }
        
        return nil
    }

}
