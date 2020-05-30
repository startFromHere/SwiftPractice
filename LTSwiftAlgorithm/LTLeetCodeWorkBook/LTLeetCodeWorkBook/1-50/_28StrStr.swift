//
//  _25StrStr.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/16.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class StrStr {
    class func solution(_ haystack: String, _ needle: String) -> Int {
        if needle.count > haystack.count {return -1}
        if needle.count == 0 {return 0}
        if haystack == needle {return 0}
        let arr1 = Array(haystack)
        let arr2 = Array(needle)
        
        for i in 0...arr1.count - arr2.count {
            if arr1[i] != arr2[0] {continue}
            let startIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: i + arr2.count)
            if String(haystack[startIndex..<endIndex]) == needle {
                return i
            } else {
                continue
            }
        }
        
        return -1
    }
}
