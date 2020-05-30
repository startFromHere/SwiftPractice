//
//  _6ZConvert.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/2.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class ZConvert {
    class func solution(_ s: String, _ numRows: Int) -> String {
        
        var arr = [[Character?]]()
        if numRows <= 1 {
            return s
        }
        
        let originArr = Array(s)
        var j = 0
        for i in 0..<originArr.count {
            if j == 0 || j % (numRows - 1) == 0 {
                var tempSubArr = arr.last
                if j == arr.count {
                    tempSubArr = [Character]()
                } else {
                    arr.removeLast()
                }
                tempSubArr?.append(originArr[i])
                arr.append(tempSubArr!)
                if tempSubArr?.count == numRows {
                    j += 1
                }
            } else {
                var tempSubArr = [Character]()
                tempSubArr.append(originArr[i])
                arr.append(tempSubArr)
                j += 1
            }
        }
        
        var resultS = ""
        for i in 0..<numRows {
            for j in 0..<arr.count {
                if j == 0 || j % (numRows - 1) == 0 {
                    let a = arr[j]
                    if a.count > i {
                        resultS.append(a[i]!)
                    }
                } else if i + j%(numRows - 1) == numRows - 1 {
                    let a = arr[j]
                    if a.count > 0 {
                        resultS.append(a[0]!)
                    }
                }
            }
        }
        print(resultS)
        return resultS
        
//        let flatMap = arr.flatMap {$0}
//        let resultStr = flatMap.reduce("") { (r, c) -> String in
//            var appendStr = r
//            if let char = c {
//                appendStr += String(char)
//            }
//            return appendStr
//        }
        
//        print(resultStr)
//        return resultStr
    }
}
