//
//  NSObject+Extension.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 2018/8/31.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

extension NSObject {
    func allPropertyNames() -> [String] {
        var propertyNames:[String] = []
        var count: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &count)
        
        for i in 0 ..< Int(count) {
            let property = properties![i]
            let name = property_getName(property)
            let propertyName = String(cString: name)
            propertyNames.append(propertyName)
        }
    }
    
    func allPropertys() -> [String : Any?] {
        var dict:[String : Any?] = [String : Any?]()
        var count: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &count)
        
        for i in 0 ..< Int(count) {
            let property = properties![i]
            let name = property_getName(property)
            let propertyName = String(cString: name)
            
            if (!propertyName.isEmpty) {
                let propertyValue = self.value(forKey: propertyName)
                dict[propertyName] = propertyValue
            }
        }
        
        return dict
    }
}
