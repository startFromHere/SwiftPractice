//
//  ViewController.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/4/30.
//  Copyright © 2020 刘涛. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.test()
    }
    
    
    func buildNode() -> ListNode? {
        let l11 = ListNode.init(1)
        let l12 = ListNode.init(2)
        let l13 = ListNode.init(3)
        let l14 = ListNode.init(4)
        let l15 = ListNode.init(5)
        let l16 = ListNode.init(6)
        
        
        l11.next = l12
//        l12.next = l13
//        l13.next = l14
//        l14.next = l15
//        l15.next = l16
        
        return l11
        
        //
        //        let l21 = ListNode.init(1)
        //        let l22 = ListNode.init(3)
        //        let l23 = ListNode.init(4)
        //        l21.next = l22
        //        l22.next = l23
        //
        //        let l31 = ListNode.init(2)
        //        let l32 = ListNode.init(6)
        //        l31.next = l32
        //
        //        l13.next = l21
        //        l23.next = l31
        //
        //        let a = reverseKGroup.solution(l11, 3)
    }
    
    func buildTree() -> TreeNode {
        let node0 = TreeNode(10)
        let node1 = TreeNode(5)
        let node2 = TreeNode(15)
        let node3 = TreeNode(2)
        
//        node0.left = node1
        node0.right = node1
//        node1.right = node2
//        node2.left = node3
        
        
        return node0
    }
    
    func buildTree2() -> TreeNode {
            let node0 = TreeNode(5)
            let node1 = TreeNode(4)
            let node2 = TreeNode(1)
            let node3 = TreeNode(1)
            let node4 = TreeNode(4)
            let node5 = TreeNode(2)
            let node6 = TreeNode(2)
            
            node0.left = node1
        node0.right = node2
        node1.right = node3
        node2.right = node4
        node3.left = node5
        node4.left = node6
            
            
            return node0
        }
    
    func test() {
        let a = SortedArrayToBST.solution([-10,-3,0,5,9])
    }
}

