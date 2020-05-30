//
//  _43multiply.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Multiply {
    class func solution(_ num1: String, _ num2: String) -> String {
        
        func mutiply(of num:Int, and nums:[Int]) -> [Int] {
            if num == 0 {return [0]}
            var result = [Int]()
            var carraNum = 0
            var currentRes:Int
            for i in stride(from: nums.count - 1, to: -1, by: -1) {
                currentRes = carraNum + nums[i] * num
                carraNum = currentRes / 10
                result.insert(currentRes % 10, at: 0)
            }
            if carraNum > 0 {
                result.insert(carraNum, at: 0)
            }
            return result
        }
        
        func sumOfTwoArrays(_ arr1:[Int], _ arr2:[Int]) -> [Int] {
            if arr1.count < arr2.count {return sumOfTwoArrays(arr2, arr1)}
            
            if arr2.count == 0 {return arr1}
            
            var res = [Int]()
            var carraNum = 0
            var currentRes:Int
            for i in 0..<arr1.count {
                currentRes = arr1[arr1.count-1-i] + (i >= arr2.count ? 0 : arr2[arr2.count-1-i])
                carraNum = currentRes / 10
                res.insert(currentRes % 10, at: 0)
            }
            if carraNum > 0 {
                res.insert(carraNum, at: 0)
            }
            return res
        }
        
        if num1 == "0" || num2 == "0" {return "0"}
        
        let arr1 = Array(num1.count > num2.count ? num1 : num2).map{Int(String($0))} as! [Int]
        let newArr2 = Array(num1.count > num2.count ? num2 : num1).map{Int(String($0))} as! [Int]
        var totalSum = [Int]()
        var tempRes = [Int]()
        for i in 0..<newArr2.count {
            tempRes = mutiply(of: newArr2[newArr2.count - 1 - i], and: arr1)
            for _ in 0..<i {
                tempRes.append(0)
            }
            totalSum = sumOfTwoArrays(totalSum, tempRes)
        }
        
        return totalSum.reduce("") { $0 + String($1)}
    }
}
