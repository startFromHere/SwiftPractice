//
//  _76MinWindow.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/13.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class MinWindow {
    static func solution(_ s: String, _ t: String) -> String {
        let tArr = Array(t)
        let sArr = Array(s)
        var isMatched:Bool = false
        
        var tDic = [Character: Int]()
        for i in 0..<tArr.count {
            if tDic[tArr[i]] != nil {
                tDic[tArr[i]]! += 1
            } else {
                tDic[tArr[i]] = 1
            }
        }
        
        func checkouk(dic: [Character: Int]) -> Bool {
            for key in tDic.keys {
                if dic[key] == nil {
                    return false
                } else if dic[key]! < tDic[key]! {
                    return false
                }
            }
            return true
        }
        
        if tArr.count - sArr.count > 0 || t == "" {
            return ""
        }
        
        var matchedChars = [Character: Int]()
        var l = 0, r = 0
        if tArr.contains(sArr[0]) {
            matchedChars[sArr[0]] = 1
        }
        
        var ans = (0, s.count)
        
        while r < sArr.count {
            if checkouk(dic: matchedChars){
                if r - l < ans.1 - ans.0 {
                    ans = (l, r)
                }
                
            }
            if matchedChars.count < tArr.count {
                r += 1
                if r >= sArr.count {
                    break
                }
                if tArr.contains(sArr[r]) {
                    if matchedChars[sArr[r]] == nil {
                        matchedChars[sArr[r]] = 1
                    } else {
                        matchedChars[sArr[r]] = matchedChars[sArr[r]]! + 1
                    }
                }
                
            } else if matchedChars.count == tArr.count {
                if matchedChars[sArr[l]] != nil {
                    if matchedChars[sArr[l]]! == 1 {
                        matchedChars.removeValue(forKey: sArr[l])
                    } else {
                        matchedChars[sArr[l]] = matchedChars[sArr[l]]! - 1
                    }
                }
                l += 1
            }
        }
        
        if ans.1 - ans.0 < s.count {
            var str = ""
            for i in ans.0...ans.1 {
                str.append(sArr[i])
            }
            return str;
        }
        
        return ""
    }
}
