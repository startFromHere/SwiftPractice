//
//  _30FindSubstring.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/20.
//  Copyright © 2020 刘涛. All rights reserved.
//
//

//输入：
//s = "barfoothefoobarman",
//words = ["foo","bar"]
//输出：[0,9]
//解释：
//从索引 0 和 9 开始的子串分别是 "barfoo" 和 "foobar" 。
//输出的顺序不重要, [9,0] 也是有效答案。
//
//"wordgoodgoodgoodbestword",
//words = ["word","good","best","word"]]

class FindSubstring {
    class func solution(_ s: String, _ words: [String]) -> [Int] {
        if s.count == 0 {return []}
        if words.count == 0 {return []}
        let k = words.first!.count
        if words.count * k > s.count {return []}
        
        var hashMap1 = [String:Int]()
        var hashMap2 = [String:Int]()
        
        words.forEach {
            if hashMap1[$0] != nil{
                hashMap1[$0]! += 1
            } else {
                hashMap1[$0] = 1
            }
        }
        
        var ans = [Int]()
        let arr = Array(s)
        for i in 0..<arr.count {
            if i + k > arr.count {
                break
            }
            var str =  arr[i..<i+k].map{String($0)}.joined()
            var j = i
            
            var matchedNums = 0
            hashMap2.removeAll()
            while hashMap1[str] != nil {
                if hashMap2[str] == nil {
                    hashMap2[str] = 1
                } else {
                    hashMap2[str]! += 1
                }
                if hashMap2[str]! > hashMap1[str]! {
                    break
                } else {
                    matchedNums += 1
                    if matchedNums == words.count {
                        ans.append(i)
                        break
                    }
                }
                j += k
                
                if j > arr.count - k {
                    break
                }
                str = arr[j..<j+k].map{String($0)}.joined()
            }
        }
        
        
        return ans
    }
}
