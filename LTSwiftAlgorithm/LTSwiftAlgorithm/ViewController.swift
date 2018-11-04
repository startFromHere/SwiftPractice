//
//  ViewController.swift
//  LTSwiftAlgorithm
//
//  Created by 移动支付－刘涛 on 2018/10/24.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ValidParentheses().solution()
    }
    
}

//extension String{
//    subscript(index: Int) -> Substring {
//        get {
//            let startIndex = String.Index(encodedOffset: index)
//            let endIndex = String.Index(encodedOffset: index + 1)
//            return self[startIndex...endIndex]
//        }
//    }
//}

