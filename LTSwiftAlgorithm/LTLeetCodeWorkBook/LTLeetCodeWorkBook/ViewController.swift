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
        let node0 = TreeNode(1)
        let node1 = TreeNode(2)
        let node2 = TreeNode(3)
        let node3 = TreeNode(4)
        
        node0.left = nil
//        node0.right = node1
        node1.left = node2
        node2.left = node3
        
        
        return node0
    }
    
    func test() {
        var nums = GenerateTrees.solution(3)
    }
}

