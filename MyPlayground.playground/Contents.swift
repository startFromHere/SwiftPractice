//: Playground - noun: a place where people can play

import UIKit

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
