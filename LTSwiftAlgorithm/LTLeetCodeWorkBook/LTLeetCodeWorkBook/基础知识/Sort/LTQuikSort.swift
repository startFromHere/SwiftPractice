//
//  LTQuikSort.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/11.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

public func lt_quickSort<E:Comparable>(_ array:inout [E]) {
    func partition_leftPivot(between left:Int, and right:Int) -> Int {
        var l = left - 1
        var r = right + 1
        let pivot = array[left]
        while true {
            repeat { l += 1 } while array[l] < pivot
            repeat { r -= 1 } while array[r] > pivot
            
            if l<r {
                array.swapAt(l, r)
            } else {
                return l
            }
        }
    }
    
    func partition_rightPivot(between left:Int, and right:Int) -> Int {
        var l = left - 1
        var r = right + 1
        let pivot = array[right]
        while true {
            repeat { r -= 1 } while array[r] > pivot
            repeat { l += 1 } while array[l] < pivot
            
            if l<r {
                array.swapAt(l, r)
            } else {
                return l - 1
            }
        }
    }
    
    func quickSort(from l:Int, to r:Int) {
        if l < r {
            //以最左边的值为轴
            let i = partition_leftPivot(between: l, and: r)
            if i == r {
                print("i reached to right!left:\(l) r:(\(r))")
            }
            quickSort(from: l, to: i)
            quickSort(from: i+1, to: r)
            
            //以最右边的值为轴
//            let i = partition_rightPivot(between: l, and: r)
////            if i == r {
////                print("i reached to right!left:\(l) r:(\(r))")
////                return
////            }
//            quickSort(from: l, to: i)
//            quickSort(from: i+1, to: r)
        }
    }
    
    quickSort(from: 0, to: array.count - 1)
    
}
