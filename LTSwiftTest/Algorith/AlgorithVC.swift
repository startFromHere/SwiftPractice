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
        var lertDic = [Int: Int]()
        var rightDic = [Int: Int]()
        
        while leftIndex <= rightIndex {
            if let 
        }
        
        return nil
    }

}
