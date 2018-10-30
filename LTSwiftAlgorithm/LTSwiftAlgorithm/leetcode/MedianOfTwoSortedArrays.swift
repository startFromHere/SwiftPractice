//
//  MedianOfTwoSortedArrays.swift
//  LTSwiftAlgorithm
//
//  Created by 移动支付－刘涛 on 2018/10/26.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class MedianOfTwoSortedArrays: LeetcodeSolution {
    override func solution() {
        let nums1 = [2, 7, 11, 15]
        let nums2 = [1, 4, 6, 12]
        let medianValue = MedianOfTwoSortedArrays.mediaOfTwoSortedArrays(nums1, nums2)
        print("result:\(medianValue)")
    }
}

extension LeetcodeSolution{
    class func mediaOfTwoSortedArrays(_ nums1:[Int], _ nums2:[Int]) -> Double {
        if nums1.count > nums2.count {
            return MedianOfTwoSortedArrays.mediaOfTwoSortedArrays(nums2,nums1)
        }
        if nums2.count <= 0 {
            return 0
        }
        var maxOfLeft = 0,minOfRight = 0
        var imin = 0, imax = nums1.count, half_len = (nums1.count+nums2.count+1)/2
        var i = 0,j = 0
        while imin <= imax {
            i = (imin + imax) / 2
            j = half_len - i
            if i < nums1.count && nums2[j-1] > nums1[i] {
                imin = i+1
            } else if (i>0 && nums1[i-1] > nums2[j]) {
                imax = i-1
            } else {
                if i == 0 {
                    maxOfLeft = nums2[j-1]
                } else if (j == 0) {
                    maxOfLeft = nums1[i-1]
                } else {
                    maxOfLeft = max(nums1[i-1], nums2[j-1])
                }
                
                if (nums1.count + nums2.count) % 2 == 1 {
                    return Double(maxOfLeft)
                }
                
                if i == nums1.count {
                    minOfRight = nums2[j]
                } else if (j == nums2.count) {
                    minOfRight = nums1[i]
                } else {
                    minOfRight = min(nums1[i], nums2[j])
                }
                return ((Double)(minOfRight + maxOfLeft) / 2)
            }
        }
        
        
        
        return 0
    }
}
