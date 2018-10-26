//
//  LongestSubStringWithoutRepeatCharacter.swift
//  LTSwiftAlgorithm
//
//  Created by 移动支付－刘涛 on 2018/10/24.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class LongestSubStringWithoutRepeatCharacter: LeetcodeSolution {
    override func solution() {
        let string = "ujipehkppqyyhbwaekjhzspmaqpxwexsnfjtmujbmhbvkxwqjhxlbpzbfpzctwwibgbqcmrqwvlgsjxesuptlqvrhuvasrkt"
        self.lengthOfLongestSubstring(string)
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int{
        if s.count <= 1 {
            return s.count
        }
        
        var maxLength = 0
        //n*n
//        for index in 0..<s.count {
//            let mainSubstr = NSMutableString.init(string: "")
//            for j in index..<s.count{
//                let start = String.Index(encodedOffset: j)
//                let end = String.Index(encodedOffset: j+1)
//                let substring = String(s[start..<end])
//
//                let currentCharacter = substring
//                if !mainSubstr.contains(currentCharacter) {
//                    mainSubstr.append(currentCharacter)
//                } else {
//                    break;
//                }
//            }
//            if maxLength < mainSubstr.length {
//                maxLength = mainSubstr.length
//                print(mainSubstr)
//            }
//        }
        
        //n
//        var subString = String.init()
//        var subStringStartLocation = 0
//        for index in 0..<s.count {
//            let start = String.Index(encodedOffset: index)
//            let end = String.Index(encodedOffset: index+1)
//            let currentCharacter = String(s[start..<end])
//
//            if subString.contains(currentCharacter) {
//                let existCharacterRange = subString.range(of: currentCharacter)
//                let newStartIndex = start.encodedOffset > existCharacterRange!.lowerBound.encodedOffset+1 ? existCharacterRange!.lowerBound.encodedOffset+1 : start.encodedOffset
//                subString = String(s[String.Index(encodedOffset: newStartIndex + subStringStartLocation)...start])
//                subStringStartLocation = newStartIndex + subStringStartLocation
//            } else {
//                subString.append(currentCharacter)
//                if maxLength < subString.count {
//                    maxLength = subString.count
//                    print("subString:\(subString),length:\(maxLength)")
//                }
//            }
//
//            print("subString:\(subString)")
//        }
        
        //n more elegant
        var characterDic = [Character:Int]()
        var lastRepeatCharacterLoc = -1
        var index = 0
        for character in s {
            if characterDic[character] != nil && characterDic[character]! > lastRepeatCharacterLoc {
                lastRepeatCharacterLoc = characterDic[character]!
            }
            if maxLength < index - lastRepeatCharacterLoc {
                var startIndex = lastRepeatCharacterLoc < 0 ? 0 : lastRepeatCharacterLoc
                startIndex = startIndex + 1 < index - 1 ? startIndex + 1 : startIndex
                print("new subString:\(String(s[String.Index(encodedOffset: startIndex)...String.Index(encodedOffset: index)]))")
            }
            maxLength = max(index-lastRepeatCharacterLoc, maxLength)
            characterDic[character] = index
            index += 1
         }
        
        return maxLength
    }
}
