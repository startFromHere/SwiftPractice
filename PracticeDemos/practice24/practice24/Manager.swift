//
//  Manager.swift
//  practice24
//
//  Created by 刘涛 on 2018/9/12.
//  Copyright © 2018 刘涛. All rights reserved.
//

import Foundation

let sharedInstance = Manager()
class Manager {
    let id:UInt32?
    init() {
        id = arc4random_uniform(10000)
    }
}
