//
//  _4findMedianSortedArrays.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/3.
//  Copyright © 2020 刘涛. All rights reserved.
//

//https://blog.csdn.net/chen_xinjia/article/details/69258706

import Foundation

class FindMedianSortedArrays {
    class func solution(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count == 0, nums2.count == 0 {
            return 0
        }
        if nums1.count > nums2.count {
            return solution(nums2, nums1)
        }
        
        if nums1.count == 0 {
            return Double(nums2[(nums2.count-1)/2] + nums2[nums2.count/2]) / 2.0
        }
        
        let size = nums1.count + nums2.count
        var left = 0, right = nums1.count
        var leftCount1 = nums1.count / 2
        var leftCount2 = size / 2 - leftCount1
        
        var left1 = 0
        var right1 = nums1.count
        var left2 = 0
        var right2 = nums2.count

        while leftCount1 <= nums1.count {
            leftCount1 = (right + left) / 2
            leftCount2 = size/2 - leftCount1
            
            left1 = leftCount1 == 0 ? Int.min : nums1[leftCount1 - 1]
            right1 = leftCount1 == nums1.count ? Int.max : nums1[leftCount1]
            left2 = leftCount2 == 0 ? Int.min : nums2[leftCount2 - 1]
            right2 = leftCount2 == nums2.count ? Int.max : nums2[leftCount2]
            
            if left1 > right2 {
                right = leftCount1 - 1
            } else if left2 > right1 {
                left = leftCount1 + 1
            } else {
                if size % 2 == 0 {
                    left1 = max(left1, left2)
                    right1 = min(right1, right2)
                    return Double(left1 + right1) / 2
                } else {
                    return Double(min(right1, right2))
                }
            }
        }
        
         return -1
    }
}
