//
//  Product.swift
//  practice01
//
//  Created by 刘涛 on 2018/8/6.
//  Copyright © 2018 刘涛. All rights reserved.
//

import Foundation

struct Product{
    var name: String?
    var cellImageName: String?
    var fullScreenImageName: String?
    
    init(name:String, cellImageName:String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullScreenImageName = fullscreenImageName
    }
}
