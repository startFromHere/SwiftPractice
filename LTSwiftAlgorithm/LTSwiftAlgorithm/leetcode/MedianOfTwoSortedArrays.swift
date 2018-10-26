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
        
        
        return 0
    }
}
