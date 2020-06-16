//
//  _70ClimbStairs.swift
//  LTLeetCodeWorkBook
//
//  Created by 刘涛 on 2020/6/12.
//  Copyright © 2020 刘涛. All rights reserved.
//

import Foundation

class ClimbStairs {
    static func solution(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        
        var db = (1,1)
        for _ in 2...n {
            db = (db.1, db.0 + db.1)
        }
        
        return db.1
    }
}
