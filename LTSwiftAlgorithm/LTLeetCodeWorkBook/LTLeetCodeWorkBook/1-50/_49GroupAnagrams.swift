//
//  _49GroupAnagrams.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/5.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class GroupAnagrams {
    class func solution(_ strs: [String]) -> [[String]] {

        var dic = [String : [String]]()
        for str in strs {
            let sortedStr = String(str.sorted())
            if dic[sortedStr] == nil {
                dic[sortedStr] = [String]()
            }
            dic[sortedStr]!.append(str)
        }
        
        return Array(dic.values)
    }
    
}
