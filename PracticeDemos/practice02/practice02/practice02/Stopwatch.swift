//
//  Stopwatch.swift
//  practice02
//
//  Created by 移动支付－刘涛 on 2018/8/9.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class Stopwatch: NSObject {
    var counter: Double
    var timer: Timer
    override init() {
        counter = 0.0
        timer = Timer()
    }
}
