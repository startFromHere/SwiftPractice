//
//  _149MaxPoints.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/7/4.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MaxPoints {
    static func solution(_ points: [[Int]]) -> Int {
        if points.count < 3 {
            return points.count
        }
        var ans = 0
        var temp = 0
        var xi: Int, xj: Int, xk: Int
        var yi: Int, yj: Int, yk: Int
        for i in 0..<points.count - 2 {
            xi = points[i].first!
            yi = points[i].last!
            for j in 1..<points.count - 1 {
                xj = points[j].first!
                yj = points[j].last!
                if xi == xj , yi == yj {
                    continue
                }
                temp = 2
                for k in i..<points.count {
                    if k == i || k == j {continue}
                    xk = points[k].first!
                    yk = points[k].last!
                    
                    if xi == xj || xj == xk || xi == xk {
                        if xi == xj && xj == xk {
                            temp += 1
                        } else if ((xk == xj && yk == yj) || (xi == xk && yi == yk)) {
                            temp += 1
                        }
                    } else if Float((yi - yj)) / Float((xi - xj)) == Float((yk - yj)) / Float((xk - xj))  {
                        temp += 1
                    }
                }
                ans = max(ans, temp)
            }
        }
        
        return ans
    }
}
