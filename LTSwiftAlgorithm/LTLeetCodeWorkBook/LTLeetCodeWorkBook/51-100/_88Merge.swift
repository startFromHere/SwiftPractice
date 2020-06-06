//
//  _88Merge.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/3.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class Merge {
    class func solution(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        for i in m..<m+n{
            nums1[i] = nums2[i-m]
        }
        
        func sort(from l:Int, to r:Int, by sentry:Int){
            var left = l,right = r
            if left >= right {
                return
            }
            while left < right {
                while nums1[left] <= sentry && left < right  {
                    left += 1
                }
                
                while nums1[right] > sentry && left < right {
                    right -= 1
                }
                
                let temp = nums1[left]
                nums1[left] = nums1[right]
                nums1[right] = temp
            }
            sort(from: l, to:left-1, by: nums1[left-1])
            if right == l {
                right += 1
            }
            sort(from: right, to: r, by: nums1[r])
            
        }
        
        sort(from: 0, to: m+n-1, by: nums1[m+n-1])
    }
}
