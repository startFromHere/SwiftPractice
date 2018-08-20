//
//  ToDoItem.swift
//  practice04
//
//  Created by 移动支付－刘涛 on 2018/8/20.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class ToDoItem:NSObject {
    var id: String
    var image: String
    var title: String
    var date: Date
    
    init(with id: String, image: String, title: String, date: Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
}
