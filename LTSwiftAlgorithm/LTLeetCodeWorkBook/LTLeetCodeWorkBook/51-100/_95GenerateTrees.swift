//
//  _93GenerateTrees.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/16.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class GenerateTrees {
    static func solution(_ n: Int) -> [TreeNode?] {
    
        func _solution(from low: Int, to high: Int) -> [TreeNode?] {
            var trees = [TreeNode?]()
            if low > high {
                return [nil]
            }
            if low == high {
                return [TreeNode(low)]
            }
            
            for i in low...high {
                
                let trees1 = _solution(from: low, to:  i - 1)
                let trees2 = _solution(from: i+1, to: high)
                for j in 0..<trees1.count {
                    for k in 0..<trees2.count {
                        let tree = TreeNode(i)
                        tree.left = trees1[j]
                        tree.right = trees2[k]
                        
                        trees.append(tree)
                    }
                }
            }
            
            return trees
        }
        
        return _solution(from: 1, to: n)
    }
}
