//
//  ViewController.swift
//  practice04
//
//  Created by 移动支付－刘涛 on 2018/8/20.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

var todos: [ToDoItem] = []

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        todos = [ToDoItem(id: "1", image: <#T##String#>, title: <#T##String#>, date: <#T##Date#>)]
        
    }
    
}

