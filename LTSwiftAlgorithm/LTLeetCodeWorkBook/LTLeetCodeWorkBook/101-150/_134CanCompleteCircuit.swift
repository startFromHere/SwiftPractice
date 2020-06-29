//
//  _134CanCompleteCircuit.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/28.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class CanCompleteCircuit {
    static func solution(_ gas: [Int], _ cost: [Int]) -> Int {
        if gas.count == 0 {
            return -1
        }
        
        var i = 0
        var stop = false
        var remain = 0
        while i < gas.count {
            stop = false
            remain = 0
            var j = i
            while !stop {
                var index = j
                if index >= gas.count {
                    index = index % gas.count
                    if index == i {
                        return i
                    }
                }
                remain += gas[index] - cost[index]
                if remain < 0 {
                    stop = true
                }
                j += 1
            }
            
            i = j
        }
        return -1
    }
}
