//: Playground - noun: a place where people can play

import UIKit


func computeIntArray(xs:[Int],transform:(Int)->Int)->[Int]{
    var result:[Int] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

func doubleArray(xs:[Int]) -> [Int] {
    return computeIntArray(xs: xs, transform: { (x) -> Int in
        return x * 2
    })
}


let arr = [1,2,3,5]

doubleArray(xs: arr)

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            let diff = target - nums[i]
            if (nums.contains(diff)){
                return [i,nums.index(of: diff)!]
            }
        }
        return []
    }
}

let nums = [2, 7, 11, 15], target = 9

let solution = Solution()
let result = solution.twoSum(nums, target)
