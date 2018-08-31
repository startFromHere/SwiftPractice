//
//  LTUserInfo.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 2018/8/31.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTUserInfo: NSObject {
    class func UserDefaultsClear() {
        let defaults:UserDefaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        
        for key in dictionary.keys {
            defaults.removeObject(forKey: key)
            defaults.synchronize()
        }
    }
    
    class func removeObjectForKey(_ key:String) {
        let defaults:UserDefaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    class func setObject(_ value:Any?,key:String) {
        LTUserInfo.setObject(value, key: key)
    }
    
    class func objectForKey(_ key:String) -> Any? {
        let userdefaults = UserDefaults.standard
        return userdefaults.object(forKey:key)
    }
}
