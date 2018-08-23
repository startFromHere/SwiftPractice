//
//  Utils.swift
//  practice04
//
//  Created by 移动支付－刘涛 on 2018/8/22.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

func dateFromString(_ string: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: string)
}

func stringFromDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}

