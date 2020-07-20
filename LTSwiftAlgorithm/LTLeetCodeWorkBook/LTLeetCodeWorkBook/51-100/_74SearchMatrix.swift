//
//  _74SearchMatrix.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/11.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class SearchMatrix {
    static func solution(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count < 1 {
            return false
        }
        
        if matrix.first!.count < 1 {
            return false
        }
        
        var i = 0, j = matrix.count - 1
        var mid = (i + j) >> 1
        while i < j {
            let num = matrix[mid].first!
            
            if num == target {
                return true
            } else if num > target {
                j = mid - 1
            } else if num < target {
                if i == mid {
                    if i == j - 1, matrix[j].first! <=  target {
                        i = j
                    }
                    break
                }
                i = mid
            }
            mid = (i + j) >> 1
        }
        
        if j<0 || i>matrix.count - 1 {
            return false
        }
        if matrix[mid].first == target {
            return true
        }
        
        let arr = matrix[i]
        i = 0
        j = arr.count - 1
        mid = (i + j) >> 1
        while i < j {
            let num = arr[mid]
            
            if num == target {
                return true
            }
            
            if num < target {
                i = mid + 1
            } else if num > target {
                j = mid - 1
            }
            mid = (i + j) >> 1
        }
        
        if i == j, arr[mid] == target {
            return true
        }
        
        return false
    }
}
