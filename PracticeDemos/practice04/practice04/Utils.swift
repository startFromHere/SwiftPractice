//
//  Utils.swift
//  practice04
//
//  Created by 移动支付－刘涛 on 2018/8/22.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

struct defaultFormatter {
    static var formatter = DateFormatter() {
        didSet {
            formatter.dateFormat = "YYYY-MM-dd"
        }
    }

    static func stringFromDate(date: Date) -> String {
        return formatter.string(from: date)
    }
    
    static func dateFromString(string: String) -> Date {
        return formatter.date(from: string) ?? Date()
    }
}


