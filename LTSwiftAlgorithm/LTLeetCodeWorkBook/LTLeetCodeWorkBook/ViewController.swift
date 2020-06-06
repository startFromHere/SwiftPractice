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
    
    
    func buildNode() {
        //        let l11 = ListNode.init(1)
        //        let l12 = ListNode.init(4)
        //        let l13 = ListNode.init(5)
        //        l11.next = l12
        //        l12.next = l13
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
    
    func test() {
        var nums = GroupAnagrams.solution(["eat", "tea", "tan", "ate", "nat", "bat"])
    }
}

