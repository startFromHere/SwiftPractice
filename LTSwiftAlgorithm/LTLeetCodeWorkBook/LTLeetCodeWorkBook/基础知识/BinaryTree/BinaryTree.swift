//
//  BinaryTree.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/5/11.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class BinaryTree {
    var root:Node?
    
    class Node{
        var leftChild:Node?
        var rightChild:Node?
        var value:Int
        init(_ v:Int) {
            value = v
        }
        
        convenience init(){
            self.init(0)
        }
    }
    
    init() {
        root = nil
    }
    
    func tree() -> Node {
        let root = Node.init(3)
        let leftNode = Node.init(2)
        let righNode = Node()
        root.leftChild = leftNode
        root.rightChild = righNode
        
        return root
    }
    
    var preVal = Int.min
    func checkIsSearchTree(node:Node?) -> Bool {
        if node == nil {return true}
        if !checkIsSearchTree(node: node?.leftChild) {return false}
        if preVal > node!.value {return false}
        preVal = node!.value
        if !checkIsSearchTree(node: node?.rightChild) {return false}
        return true
    }
}
